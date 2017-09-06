//
//  KeyChainAccessManager.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 06/09/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import KeychainAccess

struct KeyChainAccessManagerKeys {
    static let keychainServiceIdentifier = "KeyChainAccessManager"
}

open class KeyChainAccessManager {
    var keychain = Keychain(service: BuildType.active.identifier(suffix: KeyChainAccessManagerKeys.keychainServiceIdentifier))

    func getUserLoginCredentials(username: String) -> SignInUserCredentials {

        var userLogin: SignInUserCredentials = SignInUserCredentials(userName: username, password: nil)
        do {
            let userPassword = try keychain.getString(username)
            if userPassword != nil {
                userLogin.password = userPassword
            }
        }
        catch let error {
            Log.error("Error getting user login credentials to keychain: \(error.localizedDescription)")
        }

        return userLogin
    }

    func saveUserLoginCredentials(credentials: SignInUserCredentials) {
        do {
            if credentials.userName != nil {
                if credentials.password != nil {
                    try keychain.set(credentials.password!, key: credentials.userName!)
                }
                else {
                    try keychain.remove(credentials.userName!)
                }
            }
        }
        catch let error {
            Log.error("Error setting user login credentials to keychain: \(error.localizedDescription)")
        }

    }
}
