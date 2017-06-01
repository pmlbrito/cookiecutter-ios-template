//
//  Log.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 01/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation
import XCGLogger

open class Log: XCGLogger {
    
    fileprivate init() {
        super.init()
    }
    fileprivate let logger = Log()

    static func setup(logLevel: BuildType) {
        switch logLevel {
        case .debug:
            self.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, showDate: true, writeToFile: nil, fileLevel: nil)
        default:
            self.setup(level: .error, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, showDate: true, writeToFile: nil, fileLevel: nil)
        }
    }
}
