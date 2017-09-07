//
//  OnboardingProcess.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 30/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
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
