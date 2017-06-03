//
//  BaseViewController.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 03/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.bindUI(viewController: self)
    }
    
    var presenter: BasePresenter?
    
    func showError(error: Error) {
        //TODO: show alertcontroller
    }
    
    func showLoadingIndicator() {
        //TODO: show loading indicator
    }
    func hideLoadingIndicator() {
        //TODO: hide loading indicator
    }
}
