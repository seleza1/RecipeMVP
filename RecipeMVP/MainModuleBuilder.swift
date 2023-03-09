//
//  MainModuleBuilder.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

protocol AssemblyBuilderMainProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
}


class MainBuilder: AssemblyBuilderMainProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }


}
