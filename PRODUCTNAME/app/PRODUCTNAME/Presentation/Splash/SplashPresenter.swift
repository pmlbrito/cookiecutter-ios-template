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
            
            //with error
            self.processInitialConfigsLoad(model:  ["success":false, "error": BaseError(description: "Whooops something went wrong")])
            
            //without error
//            self.processInitialConfigsLoad(model:  ["success":true])
        }
    }
    
    func processInitialConfigsLoad(model: Dictionary<String,Any>) {
        viewController?.hideLoadingIndicator()
        
        let processResponseModel = SplashViewModel(dictionary: model)
        
        if(processResponseModel.error != nil) {
            (viewController as? SplashViewControllerProtocol)?.displayError(error: processResponseModel.error!)
            return
        }
        (viewController as? SplashViewControllerProtocol)?.splashLoadingFinished(viewModel: processResponseModel)
    }
}
