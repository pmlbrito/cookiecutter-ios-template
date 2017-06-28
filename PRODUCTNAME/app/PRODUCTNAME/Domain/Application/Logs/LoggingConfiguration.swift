//
//  LoggingConfiguration.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 01/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit
import XCGLogger

struct LoggingConfiguration: AppLifecycleConfiguration {
    func onDidLaunch(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        Log.setup(logLevel: BuildType.active)
    }
}
