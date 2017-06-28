//
//  BaseError.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 20/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation

class BaseError: NSError {
    convenience init(description: String?) {
        self.init(domain: Bundle.main.bundleIdentifier!, code: -1, userInfo: [NSLocalizedDescriptionKey: description ?? "Generic Error"])
    }
}
