//
//  Router.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderLoginProtocol? { get set }
    func pushToLogin()
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
}

class Router: RouterProtocol {
    var assemblyBuilder: AssemblyBuilderLoginProtocol?
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil, assemblyBuilder: AssemblyBuilderLoginProtocol? = nil) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createLoginModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    func pushToLogin() {
        print("push")
    }

}
