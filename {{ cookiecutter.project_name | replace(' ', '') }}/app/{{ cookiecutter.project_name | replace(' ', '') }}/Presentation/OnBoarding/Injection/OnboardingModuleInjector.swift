//
//  OnboardingModuleInjector.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 30/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import Swinject

class OnboardingModuleInjector: ModuleInjectionProtocol {
    static let container = Container()

    func setup() {
        resolver.register(OnboardingViewController.self) { r in
            let controller = OnboardingViewController(viewModels: OnboardingContent.pageViewModels)

            let defaultsManager = UserDefaultsManagerInjector().resolver.resolve(UserDefaultsManager.self)
            let process = r.resolve(OnboardingProcessProtocol.self, argument: defaultsManager)

            let interactor = r.resolve(OnboardingInteractorProtocol.self, argument: process)

            controller.presenter = r.resolve(OnboardingPresenterProtocol.self, argument: interactor) as? BasePresenter
            return controller
        }

        resolver.register(OnboardingPresenterProtocol.self) { (_, interactor: OnboardingInteractorProtocol?) in
            OnboardingPresenter(interactor: interactor)
        }

        resolver.register(OnboardingInteractorProtocol.self) { (_, process: OnboardingProcessProtocol?) in
            OnboardingInteractor(process: process)
        }

        resolver.register(OnboardingProcessProtocol.self) { (_, userDefaults: UserDefaultsManager?) in
            OnboardingProcess(userDefaults: userDefaults)
        }
    }
}

extension OnboardingModuleInjector {
    var resolver: Container { return OnboardingModuleInjector.container }
}
