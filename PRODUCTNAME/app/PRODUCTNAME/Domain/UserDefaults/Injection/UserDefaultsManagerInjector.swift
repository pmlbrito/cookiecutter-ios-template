//
//  UserDefaultsManagerInjector.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 28/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
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
