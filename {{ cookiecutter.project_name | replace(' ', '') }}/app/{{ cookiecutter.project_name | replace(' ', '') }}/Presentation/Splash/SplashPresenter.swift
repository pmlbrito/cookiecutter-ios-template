//
//  SplashPresenter.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 03/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit
import RxSwift

protocol SplashPresenterProtocol: BasePresenterProtocol {
    func loadInitialConfigs()
}

class SplashPresenter: BasePresenter, SplashPresenterProtocol {
    var interactor: SplashInteractorProtocol?

    init(interactor: SplashInteractorProtocol?) {
        self.interactor = interactor
    }

    func loadInitialConfigs() {
        self.viewController?.showLoadingIndicator()
        //call Process
        if let subscription = self.interactor?.validateUserWelcomeStatus().observeOn(MainScheduler.instance).subscribe(onSuccess: { (result) in
            self.processInitialConfigsLoad(model: ["success": (!result.hasError() && result.result)])
        }, onError: { (error) in
            self.processInitialConfigsLoad(model: ["success": false, "error": BaseError(description: error.localizedDescription)])
        }) {
            self.disposeBag.insert(subscription)
        }
    }

    func processInitialConfigsLoad(model: [String: Any]) {
        self.viewController?.hideLoadingIndicator()
        let processResponseModel = SplashViewModel(dictionary: model)

        if processResponseModel.error != nil {
            (viewController as? SplashViewControllerProtocol)?.displayError(error: processResponseModel.error!)
            return
        }

        if let processResult = processResponseModel.success, processResult == true {
            //go to login
            self.viewController?.transtitionToNextViewController(fromViewController: self.viewController!, destinationViewController: SignInModuleInjector().resolver.resolve(SignInViewController.self), transitionType: ViewControllerPresentationType.ReplaceAtRoot)
            return
        }

        self.viewController?.transtitionToNextViewController(fromViewController: self.viewController!, destinationViewController: OnboardingModuleInjector().resolver.resolve(OnboardingViewController.self), transitionType: ViewControllerPresentationType.ReplaceAtRoot)
    }
}
