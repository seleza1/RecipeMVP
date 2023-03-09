//
//  LoginPresenter.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

protocol LoginViewProtocol: AnyObject {

}

protocol LoginViewPresenterProtocol: AnyObject {
    init(view: LoginViewProtocol, router: RouterProtocol)

}

class LoginPresenter: LoginViewPresenterProtocol {

    unowned var view: LoginViewProtocol?
    var router: RouterProtocol!
    required init(view: LoginViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }


}

