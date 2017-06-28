//
//  SplashInteractor.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 28/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
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
        return process?.checkUserWelcome().delaySubscription(RxTimeInterval(3), scheduler: MainScheduler.asyncInstance) ??  Single.just(BoolProcessResult(status: ProcessResult.Status.unknown, resultValue: false))
    }
}
