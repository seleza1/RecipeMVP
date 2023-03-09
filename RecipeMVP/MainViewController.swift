//
//  MainViewController.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

extension MainViewController: MainViewProtocol {
    
}
