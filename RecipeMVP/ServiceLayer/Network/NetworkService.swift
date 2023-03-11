//
//  NetworkService.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

protocol NetworkServiceProtocol: AnyObject {
    func getRandomRecipes(url: String, completion: @escaping(Result<[Recipe], NetworkError>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func getRandomRecipes(url: String, completion: @escaping(Result<[Recipe], NetworkError>) -> Void) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.invalidURL))
                return
            }

             // String(data: data, encoding: .utf8).map { print($0) }

            do {
                let json = try JSONDecoder().decode(Recipes.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(json.recipes))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()

    }
}
