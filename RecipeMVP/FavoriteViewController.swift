//
//  FavoriteViewController.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    var presenter: FavoritePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension FavoriteViewController: FavoriteViewProtocol {
    
}
