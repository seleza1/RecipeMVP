//
//  LoginModuleBuilder.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
}

class ModelBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }


}
