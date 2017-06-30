//
//  OnboardingPresenter.swift
//  PRODUCTNAME
//
//  Created by Pedro Brito on 30/06/2017.
//  Copyright © 2017 pmlb. All rights reserved.
//

import Foundation

import RxSwift

protocol OnboardingPresenterProtocol: BasePresenterProtocol {
    func userFinishedWelcome()
}

class OnboardingPresenter: BasePresenter, OnboardingPresenterProtocol {
    var interactor: OnboardingInteractorProtocol?

    init(interactor: OnboardingInteractorProtocol?) {
        self.interactor = interactor
    }

    func userFinishedWelcome() {
        self.viewController?.showLoadingIndicator()
        //call Process
        if let subscription = self.interactor?.updateUserWelcomeStatus().observeOn(MainScheduler.instance).subscribe(onSuccess: { (result) in
            self.processUserActionResult(model: ["success": (!result.hasError() && result.result)])
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

        if let processResult = processResponseModel.success, processResult == true {
            //TODO: go to login
//            self.viewController?.transtitionToNextViewController(fromViewController: self.viewController!, destinationViewController: OnBoardingViewController(), transitionType: ViewControllerPresentationType.ReplaceAtRoot)
            return
        }
    }
}
