//
//  BaseViewControllerModels.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 03/06/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol {
    func showError(error: BaseError)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func transtitionToNextViewController(fromViewController: UIViewController, destinationViewController: UIViewController?, transitionType: ViewControllerPresentationType?)
}

protocol BasePresenterProtocol {
    func bindUI(viewController: UIViewController)
}
