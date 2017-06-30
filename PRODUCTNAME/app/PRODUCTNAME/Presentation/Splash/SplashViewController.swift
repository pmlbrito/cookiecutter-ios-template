//
//  SplashViewController.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 30/05/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

protocol SplashViewControllerProtocol: BaseViewControllerProtocol {
    func displayError(error: BaseError)
}

class SplashViewController: BaseViewController, SplashViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blue
        (self.presenter as? SplashPresenterProtocol)?.loadInitialConfigs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SplashViewController {
    func displayError(error: BaseError) {
        self.showError(error: error)
    }
}
