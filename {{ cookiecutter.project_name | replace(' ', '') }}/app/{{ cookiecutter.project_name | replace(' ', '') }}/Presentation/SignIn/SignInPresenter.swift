//
//  SignInPresenter.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 06/09/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import RxSwift

protocol SignInPresenterProtocol: BasePresenterProtocol {
    func loadSavedState()
    func doSignInUser(userCredentials: SignInUserCredentials)
    func goToRegister()
}

class SignInPresenter: BasePresenter, SignInPresenterProtocol {
    var interactor: SignInInteractorProtocol?

    init(interactor: SignInInteractorProtocol?) {
        self.interactor = interactor
    }

    func loadSavedState() {
        if let subscription = self.interactor?.checkForUserLoginCredentials().observeOn(MainScheduler.instance).subscribe(onSuccess: { (result) in
            self.processLoadSavedState(model: ["success": (!result.hasError() && result.result != nil), "credentials": result.result ?? ""])
        }, onError: { (error) in
            self.processLoadSavedState(model: ["success": false, "error": BaseError(description: error.localizedDescription)])
        }) {
            self.disposeBag.insert(subscription)
        }
    }

    func processLoadSavedState(model: [String: Any]) {
        let processResponseModel = SignInViewModel(dictionary: model)

        if processResponseModel.error != nil {
             (viewController)?.showError(error: processResponseModel.error!)
            return
        }

        if let processResult = processResponseModel.success, processResult == true {
            //setup loaded values
            (self.viewController as? SignInViewControllerProtocol)?.configureLoadedState(model: processResponseModel)
            return
        }
    }

    func doSignInUser(userCredentials: SignInUserCredentials) {
        //TODO: implement API Cliente first

        //call Process
        if let subscription = self.interactor?.storeUserLoginCredentials(credentials: userCredentials).observeOn(MainScheduler.instance).subscribe(onSuccess: { (result) in

            switch result.statusCode {
            case .ok:
                 Log.debug("Credentials saved successfully")
                break
            case .unknown:
                 Log.error("UNKOWN ERROR")
                break
            case .error:
                 Log.error("Credentials NOT SAVED successfully")
                break
            }
        }, onError: { (error) in
            Log.error(error)
        }) {
            self.disposeBag.insert(subscription)
        }
    }

    func goToRegister() {
        //TODO:
        (viewController)?.showError(error: BaseError(description: "Feature Not Implemented YET"))
    }
}
