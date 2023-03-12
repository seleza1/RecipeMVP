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

}

protocol RouterProtocol: RouterMain {
    func setupTabBar()
    func pushDetailsVC(recipe: Recipe)
}

class Router: RouterProtocol {

    var assemblyBuilder: AssemblyBuilderProtocol?
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil, assemblyBuilder: AssemblyBuilderProtocol? = nil) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func setupTabBar() {
        guard let mainViewController = assemblyBuilder?.createMainModule(router: self),
        let favViewController = assemblyBuilder?.createFavoriteModule(router: self) else { return }
        
        let tabBar = UITabBarController()
        
        let listOfRecipesViewController = createNavController(
            viewController: mainViewController,
            itemName: "Recipes",
            itemImage: "list.bullet"
        )

        let favoriteRecipesViewController = createNavController(
            viewController: favViewController,
            itemName: "Top deserts",
            itemImage: "heart.fill"
        )

        tabBar.viewControllers = [listOfRecipesViewController, favoriteRecipesViewController]
        
        navigationController?.viewControllers = [tabBar]
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }

    func createNavController(viewController: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item

        return navigationController
    }

    func pushDetailsVC(recipe: Recipe) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailsModule(recipe: recipe, router: self) else { return }
            navigationController.present(detailViewController, animated: true)
        }
    }
}
