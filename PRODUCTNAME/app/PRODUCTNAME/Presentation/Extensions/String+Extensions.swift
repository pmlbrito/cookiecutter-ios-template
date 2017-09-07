//
//  String+Extensions.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 06/09/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
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
