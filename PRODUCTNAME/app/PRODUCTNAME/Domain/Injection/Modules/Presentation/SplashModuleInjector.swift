//
//  SplashModuleInjector.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 01/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation
import Swinject

class SplashModuleInjector: ModuleInjectionProtocol {
    static let container = Container()
    
    func setup() {
        resolver.register(SplashViewController.self) { _ in
            let controller = SplashViewController()
            return controller
        }
    }
}

extension SplashModuleInjector {
    var resolver: Container { return SplashModuleInjector.container }
}
