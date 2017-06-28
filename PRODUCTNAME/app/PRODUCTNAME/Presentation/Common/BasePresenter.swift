//
//  BasePresenter.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 03/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

class BasePresenter: BasePresenterProtocol {
    func bindUI(viewController: UIViewController) {
        self.viewController = viewController as? BaseViewController
    }

    var viewController: BaseViewController?
}
