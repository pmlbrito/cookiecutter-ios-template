//
//  SplashProcess.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 28/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import RxSwift

protocol SplashProcessProtocol {
    func checkUserWelcome() -> Single<BoolProcessResult>
}

class SplashProcess: SplashProcessProtocol {

    var defaultsManager: UserDefaultsManager?

    init(userDefaults: UserDefaultsManager?) {
        self.defaultsManager = userDefaults
    }

    func checkUserWelcome() -> Single<BoolProcessResult> {
        return Single.just(BoolProcessResult(status: ProcessResult.Status.ok, resultValue: self.defaultsManager?.userWelcomeDone ?? false))
    }
}
