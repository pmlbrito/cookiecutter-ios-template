//
//  UserDefaultsManagerInjector.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 28/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Swinject

class UserDefaultsManagerInjector: ModuleInjectionProtocol {
    static let container = Container()

    func setup() {
        resolver.register(UserDefaultsManager.self) { _ in
            UserDefaultsManager()
        }
    }
}

extension UserDefaultsManagerInjector {
    var resolver: Container { return UserDefaultsManagerInjector.container }
}
