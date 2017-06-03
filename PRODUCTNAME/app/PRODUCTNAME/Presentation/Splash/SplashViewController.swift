//
//  SplashViewController.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 30/05/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

protocol SplashViewControllerProtocol: BaseViewControllerProtocol {
    //TODO:
    func displayError(error: Error)
    
    func splashLoadingFinished(viewModel: SplashViewModel)
}

class SplashViewController: BaseViewController, SplashViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.red
        
        (self.presenter as? SplashPresenterProtocol)?.loadInitialConfigs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SplashViewController {
    func displayError(error: Error) {
        self.showError(error: error)
    }
    
    func splashLoadingFinished(viewModel: SplashViewModel) {
        if(viewModel.success != nil && viewModel.success!) {
            self.view.backgroundColor = UIColor.green
        }
    }
}

