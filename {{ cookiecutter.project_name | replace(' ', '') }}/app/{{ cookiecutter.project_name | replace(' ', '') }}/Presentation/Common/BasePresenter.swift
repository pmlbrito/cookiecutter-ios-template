//
//  BasePresenter.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 03/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit
import RxSwift

class BasePresenter: BasePresenterProtocol {
    func bindUI(viewController: UIViewController) {
        self.viewController = viewController as? BaseViewController
    }

    var viewController: BaseViewController?

    var disposeBag: DisposeBag! = DisposeBag()

    deinit {
        self.disposeBag = nil
    }
}
