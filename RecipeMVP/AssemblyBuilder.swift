//
//  MainModuleBuilder.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createFavoriteModule(router: RouterProtocol) -> UIViewController
    func createDetailsModule(recipe: Recipe, router: RouterProtocol) -> UIViewController

}

final class AssemblyBuilder: AssemblyBuilderProtocol {

    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = RecipeViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter

        return view
    }

    func createFavoriteModule(router: RouterProtocol) -> UIViewController {
        let view = FavoriteViewController()
        let presenter = FavoritePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }

    func createDetailsModule(recipe: Recipe, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, recipe: recipe, networkService: networkService, router: router)
        view.presenter = presenter

        return view
    }

}
