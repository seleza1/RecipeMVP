//
//  LoginViewController.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    var presenter: LoginViewPresenterProtocol!

    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Number or email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false


        return textField
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8817924857, green: 0.8861443996, blue: 0.9078727365, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2860158086, green: 0.6941199899, blue: 0.3407269716, alpha: 1)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let failureLabel: UILabel = {
        let label = UILabel()
        label.text = "This user already exists"
        label.textColor = .red
        label.font = label.font.withSize(12)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false


        return label
    }()

    private let succesLabel: UILabel = {
        let label = UILabel()
        label.text = "You signed up!"
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false


        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        updateUi()
        addTarget()
        setConstraints()
        setupKeyboard()

    }

    @objc func registerUser() {

    }

    @objc func loginButtonPressed() {
    }
}

extension LoginViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([

            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 18),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),

            failureLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 1),
            failureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            failureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            failureLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 1),

            succesLabel.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: -8),
            succesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            succesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }

    private func setupViews() {
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(failureLabel)
        view.addSubview(succesLabel)
    }

    private func setupKeyboard() {
        // passwordTextField.keyboardType = .asciiCapableNumberPad
        passwordTextField.isSecureTextEntry = true
    }

    private func addTarget() {
        registerButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }

    private func updateUi() {
        view.backgroundColor = .white
        failureLabel.isHidden = true
        succesLabel.isHidden = true
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController: LoginViewProtocol {
    
}
