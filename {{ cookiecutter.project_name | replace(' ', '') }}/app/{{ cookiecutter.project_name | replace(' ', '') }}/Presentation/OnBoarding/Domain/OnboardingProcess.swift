//
//  OnboardingProcess.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 30/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import RxSwift

protocol OnboardingProcessProtocol {
    func setUserWelcomeDone() -> Single<BoolProcessResult>
}

class OnboardingProcess: OnboardingProcessProtocol {

    var defaultsManager: UserDefaultsManager?

    init(userDefaults: UserDefaultsManager?) {
        self.defaultsManager = userDefaults
    }

    func setUserWelcomeDone() -> Single<BoolProcessResult> {
        return Single.just(self.updateUserWelcomeState())
    }

    fileprivate func updateUserWelcomeState() -> BoolProcessResult {
        self.defaultsManager?.userWelcomeDone = true

        return BoolProcessResult(status: ProcessResult.Status.ok, resultValue: self.defaultsManager?.userWelcomeDone ?? false)
    }
}
