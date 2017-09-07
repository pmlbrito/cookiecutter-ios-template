//
//  SplashModuleInjector.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 01/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import Swinject

class SplashModuleInjector: ModuleInjectionProtocol {
    static let container = Container()

    func setup() {
        resolver.register(SplashViewController.self) { r in
            let controller = SplashViewController()

            let defaultsManager = UserDefaultsManagerInjector().resolver.resolve(UserDefaultsManager.self)
            let process = r.resolve(SplashProcessProtocol.self, argument: defaultsManager)

            let interactor = r.resolve(SplashInteractorProtocol.self, argument: process)

            controller.presenter = r.resolve(SplashPresenterProtocol.self, argument: interactor) as? BasePresenter
            return controller
        }

        resolver.register(SplashPresenterProtocol.self) { (_, interactor: SplashInteractorProtocol?) in
            SplashPresenter(interactor: interactor)
        }

        resolver.register(SplashInteractorProtocol.self) { (_, process: SplashProcessProtocol?) in
            SplashInteractor(process: process)
        }

        resolver.register(SplashProcessProtocol.self) { (_, userDefaults: UserDefaultsManager?) in
            SplashProcess(userDefaults: userDefaults)
        }
    }
}

extension SplashModuleInjector {
    var resolver: Container { return SplashModuleInjector.container }
}
