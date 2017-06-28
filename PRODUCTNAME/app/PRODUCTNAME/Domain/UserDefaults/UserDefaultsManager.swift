//
//  SwiftyUserDefaults.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 28/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let userWelcomeDone = DefaultsKey<Bool?>("userWelcomeDone")
}

open class UserDefaultsManager {
    //override default UserDefaults space -> replace with appgroup or someother namespace
//    var Defaults: UserDefaults! = UserDefaults(suiteName: Bundle.main.bundleIdentifier)! //-> only works when app group is set with identifier
    var Defaults: UserDefaults! = UserDefaults(suiteName: "suitecustomname")!

    var userWelcomeDone: Bool {
        get {
            return Defaults[.userWelcomeDone] ?? false
        }
        set {
            Defaults[.userWelcomeDone] = newValue
        }
    }
}
