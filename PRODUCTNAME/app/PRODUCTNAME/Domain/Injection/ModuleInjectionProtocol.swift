//
//  ModuleInjectionProtocol.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 01/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation
import Swinject

public protocol ModuleInjectionProtocol: class {
    func setup()

    var resolver: Container { get }
}
