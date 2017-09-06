//
//  SplashInteractor.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 28/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import RxSwift

protocol SplashInteractorProtocol {
    func validateUserWelcomeStatus() -> Single<BoolProcessResult>
}

class SplashInteractor: SplashInteractorProtocol {

    var process: SplashProcessProtocol?

    init(process: SplashProcessProtocol?) {
        self.process = process
    }

    func validateUserWelcomeStatus() -> Single<BoolProcessResult> {
        return process?.checkUserWelcome().delaySubscription(RxTimeInterval(2), scheduler: MainScheduler.asyncInstance) ??  Single.just(BoolProcessResult(status: ProcessResult.Status.unknown, resultValue: false))
    }
}
