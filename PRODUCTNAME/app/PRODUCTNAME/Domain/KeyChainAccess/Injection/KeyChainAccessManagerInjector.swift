//
//  KeyChainAccessManagerInjector.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 06/09/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Swinject

class KeyChainAccessManagerInjector: ModuleInjectionProtocol {
    static let container = Container()

    func setup() {
        resolver.register(KeyChainAccessManager.self) { _ in
            KeyChainAccessManager()
        }
    }
}

extension KeyChainAccessManagerInjector {
    var resolver: Container { return KeyChainAccessManagerInjector.container }
}
