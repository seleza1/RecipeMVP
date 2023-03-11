//
//  MainPresenter.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)

    var recipes: [Recipe] { get set }
    func getRecipes()
    func tapOnTheRecipe(recipe: Recipe)

}

class MainPresenter: MainViewPresenterProtocol {
    func tapOnTheRecipe(recipe: Recipe) {
        router?.pushDetailsVC(recipe: recipe)
    }

    unowned var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var recipes: [Recipe] = []

    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.networkService = networkService
        self.view = view
        self.router = router
        getRecipes()
    }

    func getRecipes() {
        networkService.getRandomRecipes(url: Link.url) { [weak self] result in
            switch result {
            case .success(let news):
                self?.recipes = news
                self?.view?.success()
            case .failure(let error):
                self?.view?.failure(error: error)
            }
        }
    }

}
