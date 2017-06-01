//
//  AppLifecycleConfiguration.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 30/05/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

/**
 *  Objects conforming to this protocol provide some sort of configurable behavior intended for execution
 *  on app launch.
 */
protocol AppLifecycleConfiguration {
    
    /// A check to see if the configuration is enabled.
    var isEnabled: Bool { get }
    
    /**
     Invoked on UIApplication.applicationDidFinishLaunching to give the conforming instance a chance to execute configuration.
     
     - parameter application:   The application
     - parameter launchOptions: Optional launch options
     */
    func onDidLaunch(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
    
}

extension AppLifecycleConfiguration {
    
    var isEnabled: Bool {
        return true
    }
    
}
