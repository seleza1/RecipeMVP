//
//  LoginModuleBuilder.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

protocol AssemblyBuilderLoginProtocol {
    func createLoginModule(router: RouterProtocol) -> UIViewController
}

class LoginBuilder: AssemblyBuilderLoginProtocol {
    func createLoginModule(router: RouterProtocol) -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }
}
