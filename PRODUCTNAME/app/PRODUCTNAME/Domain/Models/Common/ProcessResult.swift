//
//  ProcessResult.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 28/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation

open class ProcessResult {
    enum Status: Int {
        case ok = 1
        case error = 2
        case unknown = -1
    }

    var statusCode: Status
    var message: String?

    init(status: Status) {
        self.statusCode = status
        self.message = nil
    }

    convenience init(resultCode: Int) {
        self.init(status: Status(rawValue: resultCode) ?? .unknown)
    }

    init(status: Status, resultMessage: String?) {
        self.statusCode = status
        self.message = resultMessage
    }

    func hasError() -> Bool {
        return self.statusCode == .error
    }
}
