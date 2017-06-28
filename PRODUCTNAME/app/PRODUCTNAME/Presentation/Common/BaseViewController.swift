//
//  BaseViewController.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 03/06/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

enum ViewControllerPresentationType: String {
    case PushStack, Modal, ReplaceNavigation, ReplaceAtRoot
}

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

    // MARK: - Base navigation actions
    func transtitionToNextViewController(fromViewController: UIViewController, destinationViewController: UIViewController?, transitionType: ViewControllerPresentationType?) {
        if transitionType != nil && destinationViewController != nil {
            switch transitionType! {
            case .PushStack:
                let navigationController = fromViewController.navigationController
                navigationController?.pushViewController(destinationViewController!, animated: true)
                break
            case .Modal:
                fromViewController.present(destinationViewController!, animated: true, completion: nil)
                break
            case .ReplaceNavigation:
                let newNavigationController = UINavigationController(rootViewController: destinationViewController!)

                let appWindow = UIApplication.shared.delegate?.window!
                //animate swapping with nice transition
                UIView.transition(with: appWindow!, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
                    appWindow!.rootViewController = newNavigationController
                }, completion: nil)
                break
            case .ReplaceAtRoot:
                let appWindow = UIApplication.shared.delegate?.window!
                //animate swapping with nice transition
                UIView.transition(with: appWindow!, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
                    appWindow!.rootViewController = destinationViewController
                }, completion: nil)
                break
            }
        }
    }
}
