//
//  MainPresenter.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {

}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, router: RouterProtocol)

}

class MainPresenter: MainViewPresenterProtocol {
    unowned var view: MainViewProtocol?
    var router: RouterProtocol!

    required init(view: MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }


}
