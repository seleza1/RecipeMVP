//
//  Model.swift
//  RecipeMVP
//
//  Created by user on 09.03.2023.
//

import Foundation

struct Recipes: Decodable {
    let recipes: [Recipe]
}

struct Recipe: Decodable {
    let title: String
    let image: String
    let instructions: String
    let readyInMinutes: Int
}
