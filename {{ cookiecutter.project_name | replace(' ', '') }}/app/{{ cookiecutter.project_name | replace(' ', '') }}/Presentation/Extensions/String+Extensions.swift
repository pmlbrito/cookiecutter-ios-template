//
//  String+Extensions.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by Pedro Brito on 06/09/2017.
//  Copyright © 2017 pmlb. All rights reserved.
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
