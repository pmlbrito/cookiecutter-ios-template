//
//  BoolProcessResult.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 28/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation

class BoolProcessResult: ProcessResult {

    var result: Bool = false

    init(status: ProcessResult.Status, resultValue: Bool) {
        super.init(status: status)
        self.result = resultValue
    }
}
