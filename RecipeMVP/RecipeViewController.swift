//
//  MainViewController.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import UIKit

class RecipeViewController: UIViewController {

    var presenter: MainViewPresenterProtocol!

    private let identifier = "cell"

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        activity.style = .large
        activity.translatesAutoresizingMaskIntoConstraints = false

        return activity

    }()

    private let uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false


        return view
    }()

    private let connectionFiledLabel: UILabel = {
        let label = UILabel()
        label.text = "Connection failed"
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Your internet connection is offline. Please check your internet connection and try again"
        label.font = label.font.withSize(14)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        return label
    }()

    private let retryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Retry", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.01562912948, green: 0.5854102373, blue: 0.9989331365, alpha: 1)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        updateTableView()
        setConstraints()
        updateUi()
        retryButton.addTarget(self, action: #selector(getAgain), for: .touchUpInside)
        
    }


    @objc func getAgain() {
        uiView.isHidden = true
    }
}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.recipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = presenter.recipes[indexPath.row].title

        return cell
    }
}

extension RecipeViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            uiView.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),
            uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            uiView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            uiView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),

            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            connectionFiledLabel.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 200),
            connectionFiledLabel.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 16),
            connectionFiledLabel.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -16),

            errorLabel.topAnchor.constraint(equalTo: connectionFiledLabel.bottomAnchor, constant: 16),
            errorLabel.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 16),
            errorLabel.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -16),

            retryButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 16),
            retryButton.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 125),
            retryButton.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -125),
            retryButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

    private func updateTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 115

    }

    private func updateUi() {
        view.backgroundColor = .white
        title = "List of recipes"
        activityIndicator.stopAnimating()
        uiView.isHidden = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func addViews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        view.addSubview(uiView)
        uiView.addSubview(connectionFiledLabel)
        uiView.addSubview(errorLabel)
        uiView.addSubview(retryButton)
    }
}

extension RecipeViewController: MainViewProtocol {
    func succes() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func failure(error: Error) {
        print(error)
    }
}
