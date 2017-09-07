//
//  OnboardingPresenter.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 30/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation
import RxSwift

enum OnboardingQuitActions: Int {
    case skip = 0
    case register = 1
    case sign_in = 2
}

protocol OnboardingPresenterProtocol: BasePresenterProtocol {
    func userFinishedWelcome(action: OnboardingQuitActions)
}

class OnboardingPresenter: BasePresenter, OnboardingPresenterProtocol {
    var interactor: OnboardingInteractorProtocol?

    init(interactor: OnboardingInteractorProtocol?) {
        self.interactor = interactor
    }

    func userFinishedWelcome(action: OnboardingQuitActions) {
        self.viewController?.showLoadingIndicator()
        //call Process
        if let subscription = self.interactor?.updateUserWelcomeStatus().observeOn(MainScheduler.instance).subscribe(onSuccess: { (result) in
            self.processUserActionResult(model: ["success": (!result.hasError() && result.result), "action": action])
        }, onError: { (error) in
            self.processUserActionResult(model: ["success": false, "error": BaseError(description: error.localizedDescription)])
        }) {
            self.disposeBag.insert(subscription)
        }
    }

    func processUserActionResult(model: [String: Any]) {
        self.viewController?.hideLoadingIndicator()
        let processResponseModel = BaseViewModel(dictionary: model)

        if processResponseModel.error != nil {
            (viewController)?.showError(error: processResponseModel.error!)
            return
        }

        //TODO: trigger correspondant viewcontroller method

        if let processResult = processResponseModel.success, processResult == true {
            //TODO: check user action
            if let action = model["action"] as? OnboardingQuitActions {

                switch action {
                case .skip:
                    //TODO: go to login
                    self.goToSignIn()
                    break
                case .sign_in:
                    //TODO: go to login
                    self.goToSignIn()
                    break
                case .register:
                    self.goToRegister()
                    break
                }
            }
            return
        }
    }

    func goToSignIn() {
         self.viewController?.transtitionToNextViewController(fromViewController: self.viewController!, destinationViewController: SignInModuleInjector().resolver.resolve(SignInViewController.self), transitionType: ViewControllerPresentationType.ReplaceAtRoot)
    }

    func goToRegister() {
        //TODO:
        (viewController)?.showError(error: BaseError(description: "Feature Not Implemented YET"))
    }
}
