//
//  BaseViewModel.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 03/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation

class BaseViewModel {
    var success: Bool? = false
    var error: BaseError?

    init() {
        self.success = false
        self.error = nil
    }

    init(dictionary: [String: Any]) {
        self.success = dictionary["success"] as? Bool ?? false
        self.error = dictionary["error"] as? BaseError
    }
}
