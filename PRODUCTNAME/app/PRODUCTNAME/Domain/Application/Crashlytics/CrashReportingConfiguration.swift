//
//  CrashReportingConfiguration.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 30/05/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Fabric
import Crashlytics
import UIKit

struct CrashReportingConfiguration: AppLifecycleConfiguration {
    
    var isEnabled: Bool {
        return BuildType.active != .debug
    }
    
    func onDidLaunch(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        Fabric.with([Crashlytics.self])
    }
    
}
