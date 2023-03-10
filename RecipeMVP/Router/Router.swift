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
    
    // func pushToMainViewcontroller()
}

protocol RouterProtocol: RouterMain {
    func setupTabBar()
}

class Router: RouterProtocol {

    var assemblyBuilder: AssemblyBuilderProtocol?
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil, assemblyBuilder: AssemblyBuilderProtocol? = nil) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

//этот метод вызываем первым
    func setupTabBar() {
        
        // создаем нормальные вьюКонтроллеры (с презентером внутри)
        guard let mainViewController = assemblyBuilder?.createMainModule(router: self),
        let favViewController = assemblyBuilder?.createFavoriteModule(router: self)else { return }
        
        // создаем дефолтный ТабБар
        let tabBar = UITabBarController()
        
        // оборачиваем наши вьюКонтроллеры в навигейшенСтеки и задаем им картинки для отображения на табБаре
        let listOfRecipesViewController = createNavController(
            viewController: mainViewController,
            itemName: "Search recipes",
            itemImage: "list.bullet"
        )
        let favoriteRecipesViewController = createNavController(
            viewController: favViewController,
            itemName: "Top deserts",
            itemImage: "brain"
        )
        
        //поместили навигейшен стеки в таббар

        tabBar.viewControllers = [listOfRecipesViewController, favoriteRecipesViewController]
        
        // поместили таббар в корневой навигейшенСтек (зачем незнаю,  но у тебя тут такая идея была, я просто сделал ее нормально)
        navigationController?.viewControllers = [tabBar]
        
    }

    func createNavController(viewController: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item

        return navigationController
    }
}


