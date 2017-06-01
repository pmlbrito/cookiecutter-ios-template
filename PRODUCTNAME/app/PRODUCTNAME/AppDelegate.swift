//
//  AppDelegate.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 30/05/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // Anything that doesn't rely on the existence of a viewcontroller should be in this preWindowConfigurations array
    let preWindowConfigurations: [AppLifecycleConfiguration] = [LoggingConfiguration(),CrashReportingConfiguration()]
    
    let moduleInjections: [ModuleInjectionProtocol] = [SplashModuleInjector()]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Don't load the main UI if we're unit testing.
        if let _: AnyClass = NSClassFromString("XCTest") {
            return true
        }
        
        for config in preWindowConfigurations where config.isEnabled {
            config.onDidLaunch(application: application, launchOptions: launchOptions)
        }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        //setup injection for modules
        for injector in moduleInjections {
            injector.setup()
        }
        
        //launch initial state from injection
        window.rootViewController = SplashModuleInjector().resolver.resolve(SplashViewController.self)
        window.makeKeyAndVisible()
        
        return true
    }
}

