//
//  SignInViewController.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 06/09/2017.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit
import Anchorage
import Swiftilities

protocol SignInViewControllerProtocol: BaseViewControllerProtocol {
    func configureLoadedState(model: SignInViewModel)
}

// MARK: SignInViewController
class SignInViewController: BaseViewController, OnboardingViewControllerProtocol {

    fileprivate let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = ColorSchemes.darkGray
        label.textAlignment = .center
        return label
    }()

    fileprivate let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = ColorSchemes.darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    fileprivate let usernameTextView: FloatingLabelTextFieldView = {
        let textinput = FloatingLabelTextFieldView()
        textinput.font = UIFont.systemFont(ofSize: 12)
        textinput.textColor = ColorSchemes.darkGray
        textinput.textAlignment = .left
        textinput.placeholder = "Username"
        textinput.borderStyle = .line
        textinput.layer.borderColor = UIColor.lightGray.cgColor
        return textinput
    }()

    fileprivate let passwordTextView: FloatingLabelTextFieldView = {
        let textinput = FloatingLabelTextFieldView()
        textinput.font = UIFont.systemFont(ofSize: 12)
        textinput.textColor = ColorSchemes.darkGray
        textinput.textAlignment = .left
        textinput.placeholder = "Password"
        textinput.isSecureTextEntry = true
        textinput.borderStyle = .line
        textinput.layer.borderColor = UIColor.lightGray.cgColor
        return textinput
    }()

    fileprivate let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("PROCEED", for: .normal) //TODO: localization
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()

    fileprivate let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("REGISTER", for: .normal) //TODO: localization
        button.setTitleColor(ColorSchemes.darkGray, for: .normal)
        button.setTitleColor(ColorSchemes.darkGray.highlighted, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 0.5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureLayout()

        (self.presenter as? SignInPresenterProtocol)?.loadSavedState()
    }
}

// MARK: Private
private extension SignInViewController {

    func configureView() {
        view.backgroundColor = .white

        headerLabel.text = "Sign In" //TODO localization
        bodyLabel.text = "Please use your User Account credentials to login with the system" //TODO localization
        view.addSubview(headerLabel)
        view.addSubview(bodyLabel)

        view.addSubview(usernameTextView)
        view.addSubview(passwordTextView)

        loginButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        view.addSubview(registerButton)
    }

    struct Layout {
        static let viewMarginInset = CGFloat(20)
        static let buttonHeight = CGFloat(55)
        static let inputHeight = CGFloat(45)
        static let headerLabelTopInset = CGFloat(100)
        static let bodyLabelTopSpace = CGFloat(20)
        static let usernameInputSideSpace = CGFloat(40)
        static let usernameInputTopSpace = CGFloat(40)
        static let passwordInputTopSpace = CGFloat(20)
        static let loginButtonVerticalSpace = CGFloat(30)
        static let registerButtonInVerticalSpace = CGFloat(18)
    }

    func configureLayout() {
        headerLabel.topAnchor == view.topAnchor + Layout.headerLabelTopInset
        headerLabel.centerXAnchor == view.centerXAnchor

        bodyLabel.topAnchor == headerLabel.bottomAnchor + Layout.bodyLabelTopSpace
        bodyLabel.centerXAnchor == view.centerXAnchor
        bodyLabel.leadingAnchor == view.leadingAnchor + Layout.viewMarginInset
        bodyLabel.trailingAnchor == view.trailingAnchor - Layout.viewMarginInset

        usernameTextView.topAnchor == bodyLabel.bottomAnchor + Layout.usernameInputTopSpace
        usernameTextView.centerXAnchor == view.centerXAnchor
        usernameTextView.leadingAnchor == view.leadingAnchor + Layout.usernameInputSideSpace
        usernameTextView.trailingAnchor == view.trailingAnchor - Layout.usernameInputSideSpace
        usernameTextView.heightAnchor == Layout.inputHeight

        passwordTextView.topAnchor == usernameTextView.bottomAnchor + Layout.passwordInputTopSpace
        passwordTextView.centerXAnchor == view.centerXAnchor
        passwordTextView.leadingAnchor == view.leadingAnchor + Layout.usernameInputSideSpace
        passwordTextView.trailingAnchor == view.trailingAnchor - Layout.usernameInputSideSpace
        passwordTextView.heightAnchor == Layout.inputHeight

        loginButton.leadingAnchor == view.leadingAnchor + Layout.usernameInputSideSpace
        loginButton.trailingAnchor == view.trailingAnchor - Layout.usernameInputSideSpace
        loginButton.topAnchor == passwordTextView.bottomAnchor + Layout.loginButtonVerticalSpace
        loginButton.heightAnchor == Layout.buttonHeight

        registerButton.leadingAnchor == view.leadingAnchor + Layout.usernameInputSideSpace
        registerButton.trailingAnchor == view.trailingAnchor - Layout.usernameInputSideSpace
        registerButton.topAnchor == loginButton.bottomAnchor + Layout.registerButtonInVerticalSpace
        registerButton.heightAnchor == Layout.buttonHeight
    }
}

// MARK: Actions Handling
private extension SignInViewController {

    @objc func signInTapped() {
        //TODO: validate fields and show alert?
        let username = usernameTextView.text
        let password = passwordTextView.text

        if !String.isNilOrEmpty(username) && !String.isNilOrEmpty(password) {
            let userLogin = SignInUserCredentials(userName: username, password: password)
            (self.presenter as? SignInPresenterProtocol)?.doSignInUser(userCredentials: userLogin)
        }
    }

    @objc func registerTapped() {
        (self.presenter as? SignInPresenterProtocol)?.goToRegister()
    }
}

extension SignInViewController: SignInViewControllerProtocol {
    func configureLoadedState(model: SignInViewModel) {
        usernameTextView.text = model.userCredentials?.userName
        passwordTextView.text = model.userCredentials?.password
    }
}
