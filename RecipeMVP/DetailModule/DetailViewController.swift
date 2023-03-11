//
//  DetailViewController.swift
//  RecipeMVP
//
//  Created by user on 11.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var presenter: DetailViewPresenterProtocol!

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(infoLabel)
        setConstraints()
        presenter.setRecipe()

    }
}

extension DetailViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)

        ])
    }
}

extension DetailViewController: DetailViewProtocol {

    func setRecipe(recipe: Recipe?) {
        infoLabel.text = recipe?.instructions
    }
}
