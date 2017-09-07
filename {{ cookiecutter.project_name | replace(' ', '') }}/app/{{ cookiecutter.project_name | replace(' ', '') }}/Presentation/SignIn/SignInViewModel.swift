//
//  SignInViewModel.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 06/09/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit

class SignInViewModel: BaseViewModel {
    var userCredentials: SignInUserCredentials?

    override init(dictionary: [String: Any]) {
        super.init(dictionary: dictionary)

        self.userCredentials = dictionary["credentials"] as? SignInUserCredentials
    }
}

class SignInCredentialsProcessResult: ProcessResult {

    var result: SignInUserCredentials?

    init(status: ProcessResult.Status, processMessage: String?, resultValue: SignInUserCredentials?) {
        super.init(status: status, resultMessage: processMessage)
        self.result = resultValue
    }
}

struct SignInUserCredentials {
    var userName: String?
    var password: String?
}
