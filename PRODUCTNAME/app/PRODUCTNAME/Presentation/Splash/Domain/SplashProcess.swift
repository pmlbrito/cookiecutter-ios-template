//
//  SplashProcess.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 28/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
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
