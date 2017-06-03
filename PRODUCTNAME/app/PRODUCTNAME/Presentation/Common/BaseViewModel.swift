//
//  BaseViewModel.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 03/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation

class BaseViewModel {
    var success: Bool? = false
    var error: Error? = nil
    
    init() {
        self.success = false
        self.error = nil
    }
    
    init(dictionary: Dictionary<String, Any>) {
        self.success = dictionary["success"] as? Bool ?? false
        self.error = dictionary["error"] as? Error
    }
}
