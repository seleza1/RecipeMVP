//
//  MainPresenter.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)

    var recipes: [Recipe]? { get set }
    func getNews()

}

class MainPresenter: MainViewPresenterProtocol {

    unowned var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var recipes: [Recipe]?

    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.networkService = networkService
        self.view = view
        self.router = router
        getNews()
    }

    func getNews() {
        networkService.getRandomRecipes(url: Link.url) { [weak self] result in
            switch result {
            case .success(let news):
                self?.recipes = news
                self?.view?.succes()
            case .failure(let error):
                self?.view?.failure(error: error)
            }
        }
    }

}
