//
//  OnboardingInteractor.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 30/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation
import RxSwift

protocol OnboardingInteractorProtocol {
    func updateUserWelcomeStatus() -> Single<BoolProcessResult>
}

class OnboardingInteractor: OnboardingInteractorProtocol {

    var process: OnboardingProcessProtocol?

    init(process: OnboardingProcessProtocol?) {
        self.process = process
    }

    func updateUserWelcomeStatus() -> Single<BoolProcessResult> {
        return process?.setUserWelcomeDone() ??  Single.just(BoolProcessResult(status: ProcessResult.Status.unknown, resultValue: false))
    }
}
