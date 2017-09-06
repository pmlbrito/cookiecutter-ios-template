//
//  BaseError.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 20/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation

class BaseError: NSError {
    convenience init(description: String?) {
        self.init(domain: Bundle.main.bundleIdentifier!, code: -1, userInfo: [NSLocalizedDescriptionKey: description ?? "Generic Error"])
    }
}
