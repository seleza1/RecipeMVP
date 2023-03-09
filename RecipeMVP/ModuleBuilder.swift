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

    func createLoginModule(router: RouterProtocol) -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }

    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = RecipeViewController()
        let presenter = MainPresenter(view: view, router: router)
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
        let favoriteRecipe = createNavController(viewController: FavoriteViewController(), itemName: "star", itemImage: "Favorite")

        tabBarViewController.viewControllers = [listOfRecipesViewController, favoriteRecipe]

        return tabBarViewController
    }
}


func createNavController(viewController: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
    let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)

    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.tabBarItem = item

    return navigationController
}
