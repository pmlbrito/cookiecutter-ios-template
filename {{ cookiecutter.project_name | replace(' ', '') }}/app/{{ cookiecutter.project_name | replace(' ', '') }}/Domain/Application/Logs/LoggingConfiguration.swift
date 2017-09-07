//
//  LoggingConfiguration.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 01/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit
import XCGLogger

struct LoggingConfiguration: AppLifecycleConfiguration {
    func onDidLaunch(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        Log.setup(logLevel: BuildType.active)
    }
}
