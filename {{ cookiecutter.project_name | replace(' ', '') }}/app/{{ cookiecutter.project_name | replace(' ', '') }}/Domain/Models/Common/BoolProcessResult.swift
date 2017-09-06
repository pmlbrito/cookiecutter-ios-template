//
//  BoolProcessResult.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 28/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation

class BoolProcessResult: ProcessResult {

    var result: Bool = false

    init(status: ProcessResult.Status, resultValue: Bool) {
        super.init(status: status)
        self.result = resultValue
    }
}
