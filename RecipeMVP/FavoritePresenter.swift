//
//  FavoritePresenter.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

protocol FavoriteViewProtocol: AnyObject {

}

protocol FavoriteViewPresenterProtocol: AnyObject {
    init(view: FavoriteViewProtocol, router: RouterProtocol)

}

class FavoritePresenter: FavoriteViewPresenterProtocol {

    unowned var view: FavoriteViewProtocol?
    var router: RouterProtocol!

    required init(view: FavoriteViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }


}

