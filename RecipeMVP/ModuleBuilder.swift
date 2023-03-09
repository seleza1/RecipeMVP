//
//  MainModuleBuilder.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createLoginModule(router: RouterProtocol) -> UIViewController
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createFavoriteModule(router: RouterProtocol) -> UIViewController
    
    func createTabBarModule(navigationController: UIViewController, navBarArray: [UIViewController]) -> UITabBarController
}

final class ModelBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = RecipeViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter

        return view
    }

    func createLoginModule(router: RouterProtocol) -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }

    func createFavoriteModule(router: RouterProtocol) -> UIViewController {
        let view = FavoriteViewController()
        let presenter = FavoritePresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }

    func createTabBarModule(navigationController: UIViewController, navBarArray: [UIViewController]) -> UITabBarController {
        let tabBarViewController = UITabBarController()
        let listOfRecipesViewController = createNavController(viewController: RecipeViewController(), itemName: "Search recipes", itemImage: "list.bullet")
        let favoriteRecipesViewController = createNavController(viewController: FavoriteViewController(), itemName: "Search recipes", itemImage: "list.bullet")

        tabBarViewController.viewControllers = [listOfRecipesViewController, favoriteRecipesViewController]

        return tabBarViewController
    }
}

func createNavController(viewController: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
    let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)

    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.tabBarItem = item

    return navigationController
}


