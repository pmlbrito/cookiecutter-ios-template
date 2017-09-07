//
//  SignInInteractor.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 06/09/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation
import RxSwift

protocol SignInInteractorProtocol {
    func checkForUserLoginCredentials() -> Single<SignInCredentialsProcessResult>
    func storeUserLoginCredentials(credentials: SignInUserCredentials) -> Single<BoolProcessResult>
}

class SignInInteractor: SignInInteractorProtocol {

    var process: SignInProcessProtocol?

    init(process: SignInProcessProtocol?) {
        self.process = process
    }

    func checkForUserLoginCredentials() -> Single<SignInCredentialsProcessResult> {
        return process?.getUserCredentials() ??  Single.just(SignInCredentialsProcessResult(status: ProcessResult.Status.unknown, processMessage: "An Unexpected error", resultValue: nil))
    }

    func storeUserLoginCredentials(credentials: SignInUserCredentials) -> Single<BoolProcessResult> {
        return process?.saveUserCredentials(credentials: credentials) ?? Single.just(BoolProcessResult(status: ProcessResult.Status.unknown, resultValue: false))
    }
}
