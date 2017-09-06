//
//  SignInModuleInjector.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 06/09/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import Swinject

class SignInModuleInjector: ModuleInjectionProtocol {
    static let container = Container()

    func setup() {
        resolver.register(SignInViewController.self) { r in
            let controller = SignInViewController()

            let defaultsManager = UserDefaultsManagerInjector().resolver.resolve(UserDefaultsManager.self)
            let keychainManager = KeyChainAccessManagerInjector().resolver.resolve(KeyChainAccessManager.self)
            let process = r.resolve(SignInProcessProtocol.self, arguments: defaultsManager, keychainManager)

            let interactor = r.resolve(SignInInteractorProtocol.self, argument: process)

            controller.presenter = r.resolve(SignInPresenterProtocol.self, argument: interactor) as? BasePresenter
            return controller
        }

        resolver.register(SignInPresenterProtocol.self) { (_, interactor: SignInInteractorProtocol?) in
            SignInPresenter(interactor: interactor)
        }

        resolver.register(SignInInteractorProtocol.self) { (_, process: SignInProcessProtocol?) in
            SignInInteractor(process: process)
        }

        resolver.register(SignInProcessProtocol.self) { (_, userDefaults: UserDefaultsManager?, keychain: KeyChainAccessManager?) in
            SignInProcess(userDefaults: userDefaults, keychain: keychain)
        }
    }
}

extension SignInModuleInjector {
    var resolver: Container { return SignInModuleInjector.container }
}
