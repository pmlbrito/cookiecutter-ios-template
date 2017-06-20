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
    
    func showError(error: BaseError) {
        //show alertcontroller
        let errorAlert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        errorAlert.addAction(defaultAction)
        
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    func showLoadingIndicator() {
        LoadingOverlay.shared.showOverlay(view: self.view)
    }
    func hideLoadingIndicator() {
        LoadingOverlay.shared.hideOverlayView()
    }
}
