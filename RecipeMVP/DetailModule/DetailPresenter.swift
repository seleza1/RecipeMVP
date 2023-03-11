//
//  DetailPresenter.swift
//  RecipeMVP
//
//  Created by user on 11.03.2023.
//

protocol DetailViewProtocol: AnyObject {

}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, recipe: Recipe, networkService: NetworkServiceProtocol, router: RouterProtocol)
    var recipes: Recipe? { get set }


}

class DetailPresenter: DetailViewPresenterProtocol {
    var recipes: Recipe?
    

    unowned var view: DetailViewProtocol?
    var router: RouterProtocol!
    var networkService: NetworkServiceProtocol!

    required init(view: DetailViewProtocol, recipe: Recipe, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
    }


}
