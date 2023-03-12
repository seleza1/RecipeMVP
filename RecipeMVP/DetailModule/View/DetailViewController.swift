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
        label.font = label.font.withSize(15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plateFood")
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView

    }()

    private var imageURL: URL? {
        didSet {
            imageView.image = nil
            updateImage()
        }
    }

    private let cookingTimeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(infoLabel)
        view.addSubview(imageView)
        view.addSubview(cookingTimeLabel)
        setConstraints()
    }

    private func updateImage() {
            guard let imageURL = imageURL else { return }
            getImage(from: imageURL) { [weak self] result in
                switch result {
                case .success(let image):
                    if imageURL == self?.imageURL {
                        self?.imageView.image = image
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }


        private func getImage(from url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {
            NetworkService().fetchImage(from: url) { result in
                switch result {
                case .success(let imageData):
                    guard let uiImage = UIImage(data: imageData) else { return }
                    completion(.success(uiImage))
                case .failure(let error):
                    print(error)
                }
            }
        }
}

extension DetailViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalToConstant: 250),

            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            cookingTimeLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 240),
            cookingTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cookingTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)

        ])
    }
}

extension DetailViewController: DetailViewProtocol {

    func setRecipe(recipe: Recipe) {
        infoLabel.text = recipe.instructions
        imageURL = URL(string: recipe.image)
        cookingTimeLabel.text = "Сooking time - \(recipe.readyInMinutes)"
    }
}
