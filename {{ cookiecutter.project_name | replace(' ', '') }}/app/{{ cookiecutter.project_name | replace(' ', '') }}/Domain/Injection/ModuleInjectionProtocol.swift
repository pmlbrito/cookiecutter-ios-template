//
//  ModuleInjectionProtocol.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 01/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import Swinject

public protocol ModuleInjectionProtocol: class {
    func setup()

    var resolver: Container { get }
}
