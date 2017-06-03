//
//  SplashPresenter.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 03/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

protocol SplashPresenterProtocol: BasePresenterProtocol {
    func loadInitialConfigs()
}

class SplashPresenter: BasePresenter, SplashPresenterProtocol {
    
    func loadInitialConfigs() {
        self.viewController?.showLoadingIndicator()
        //TODO: call Process
        
        /*DispatchQueue.global(qos: .userInitiated).async {
            let result = self.loadOrProcessSetup()
            // Bounce back to the main thread to update the UI
            DispatchQueue.main.async {
                self.processInitialConfigsLoad(model: ["load_success":true])
            }
        }*/
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // in 2 seconds...
            self.processInitialConfigsLoad(model:  ["success":true])
        }
    }
    
    func processInitialConfigsLoad(model: Dictionary<String,Any>) {
        viewController?.hideLoadingIndicator()
        
        //TODO: proceed with page loading
        (viewController as? SplashViewControllerProtocol)?.splashLoadingFinished(viewModel: SplashViewModel(dictionary: model))
    }
}
