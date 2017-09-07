//
//  String+Extensions.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 06/09/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation

extension String {
    static func isNilOrEmpty(_ string: String?) -> Bool {
        if string == nil {
            return true
        }
        return string!.isEmpty
    }
}
