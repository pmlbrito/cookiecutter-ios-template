//
//  SignInProcess.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 06/09/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import RxSwift

protocol SignInProcessProtocol {
    func getUserCredentials() -> Single<SignInCredentialsProcessResult>
    func saveUserCredentials(credentials: SignInUserCredentials) -> Single<BoolProcessResult>
}

class SignInProcess: SignInProcessProtocol {

    var defaultsManager: UserDefaultsManager?
    var keychainManager: KeyChainAccessManager?

    init(userDefaults: UserDefaultsManager?, keychain: KeyChainAccessManager?) {
        self.defaultsManager = userDefaults
        self.keychainManager = keychain
    }

    func getUserCredentials() -> Single<SignInCredentialsProcessResult> {
        var processResult = SignInCredentialsProcessResult(status: ProcessResult.Status.ok, processMessage: "Saved Credentials Not Found.", resultValue: nil)

        if let lastLoginUserName = defaultsManager?.loginUserName {
            if let userCredentials = keychainManager?.getUserLoginCredentials(username: lastLoginUserName) {
                processResult = SignInCredentialsProcessResult(status: ProcessResult.Status.ok, processMessage: nil, resultValue: userCredentials)
            }
        }
        return Single.just(processResult)
    }

    func saveUserCredentials(credentials: SignInUserCredentials) -> Single<BoolProcessResult> {
        if credentials.userName != nil && credentials.password != nil {
            self.defaultsManager?.loginUserName = credentials.userName
            self.keychainManager?.saveUserLoginCredentials(credentials: credentials)

            return Single.just(BoolProcessResult(status: ProcessResult.Status.ok, resultValue: self.defaultsManager?.loginUserName == credentials.userName && self.keychainManager?.getUserLoginCredentials(username: credentials.userName!) != nil))
        }
        else {
            let error = BoolProcessResult(status: ProcessResult.Status.error, resultValue: false)
            error.message = "Invalid Credentials"
            return Single.just(error)
        }
    }
}
