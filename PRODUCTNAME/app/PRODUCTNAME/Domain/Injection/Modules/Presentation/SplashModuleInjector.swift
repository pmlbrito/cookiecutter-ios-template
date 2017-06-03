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
        resolver.register(SplashViewController.self) { r in
            let controller = SplashViewController()
            controller.presenter = r.resolve(SplashPresenterProtocol.self) as? BasePresenter
            return controller
        }
        
        resolver.register(SplashPresenterProtocol.self) { r in
            SplashPresenter()
        }
    }
}

extension SplashModuleInjector {
    var resolver: Container { return SplashModuleInjector.container }
}
