//
//  AlcoholCocktailsData.swift
//  Cocktails
//
//  Created by Ann Yesip on 09.04.2021.
//

import Foundation

// MARK: - Cocktails
struct Cocktails: Codable {
    let drinks: [Drink]
    
}

// MARK: - Drink
struct Drink: Codable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}


