//
//  DetailPresenter.swift
//  RecipeMVP
//
//  Created by user on 11.03.2023.
//

protocol DetailViewProtocol: AnyObject {
    func setRecipe(recipe: Recipe?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, recipe: Recipe?, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func setRecipe()
}

class DetailPresenter: DetailViewPresenterProtocol {
    var recipe: Recipe?

    unowned var view: DetailViewProtocol?
    let router: RouterProtocol!
    let networkService: NetworkServiceProtocol!

    required init(view: DetailViewProtocol, recipe: Recipe?, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
    }

    func setRecipe() {
        view?.setRecipe(recipe: recipe)
    }


}
