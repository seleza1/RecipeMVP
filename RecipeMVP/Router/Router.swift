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
            guard let recipeViewController = assemblyBuilder?.createMainModule(router: self) else { return }
            guard let tabBarController = assemblyBuilder?.createTabBarModule(navigationController: navigationController, navBarArray: [recipeViewController]) else { return }
            navigationController.viewControllers = [tabBarController]
            navigationController.setNavigationBarHidden(true, animated: true)
        }
    }

    func pushToMainViewcontroller() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }

            navigationController.pushViewController(mainViewController, animated: true)
        }
    }

}
