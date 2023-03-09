//
//  Router.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }

    func pushToMainViewcontroller()
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
}

class Router: RouterProtocol {
    var assemblyBuilder: AssemblyBuilderProtocol?

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil, assemblyBuilder: AssemblyBuilderProtocol? = nil) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initialViewController() {
        if let navigationController = navigationController {
            guard let loginViewController = assemblyBuilder?.createLoginModule(router: self) else { return }
            navigationController.viewControllers = [loginViewController]
        }
    }

    func pushToMainViewcontroller() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }

            navigationController.pushViewController(mainViewController, animated: true)
        }
    }

}
