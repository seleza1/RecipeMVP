//
//  UiViewController + Extension.swift
//  RecipeMVP
//
//  Created by user on 11.03.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let imageViews: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    

    private var imageURL: URL? {
        didSet {
            imageView!.image = nil
            updateImage()
        }
    }

    static var idMainTableViewCell = "idMainTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(valueLabel)
        addSubview(imageViews)
        setConstraints()
        selectionStyle = .none
    }

    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateImage() {
        guard let imageURL = imageURL else { return }
        getImage(from: imageURL) { [weak self] result in
            switch result {
            case .success(let image):
                if imageURL == self?.imageURL {
                    self?.imageView?.image = image
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

    public func configure(name: Recipe, image: Recipe) {
        valueLabel.text = name.title
        imageURL = URL(string: image.image)

    }
}

extension MainTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([

            imageViews.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            imageViews.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            imageViews.widthAnchor.constraint(equalToConstant: 150),

            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            valueLabel.leadingAnchor.constraint(equalTo: imageViews.trailingAnchor, constant: 36)

        ])
    }
}
