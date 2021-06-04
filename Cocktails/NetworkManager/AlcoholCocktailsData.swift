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
  let strAlcoholic: String?
  let strInstructions: String?
  let strIngredient1: String?
  let strIngredient2: String?
  let strIngredient3: String?
  let strIngredient4: String?
  let strIngredient5: String?
  let strIngredient6: String?
  let strIngredient7: String?
  let strIngredient8: String?
  let strIngredient9: String?
  let strIngredient10: String?
  let strIngredient11: String?
  let strIngredient12: String?
  let strIngredient13: String?
  let strIngredient14: String?
  let strIngredient15: String?
  let strMeasure1: String?
  let strMeasure2: String?
  let strMeasure3: String?
  let strMeasure4: String?
  let strMeasure5: String?
  let strMeasure6: String?
  let strMeasure7: String?
  let strMeasure8: String?
  let strMeasure9: String?
  let strMeasure10: String?
  let strMeasure11: String?
  let strMeasure12: String?
  let strMeasure13: String?
  let strMeasure14: String?
  let strMeasure15: String?
  
  
}


// MARK: - Cocktails
struct Cocktails2: Codable {
  let drinks: [Drink]
}

// MARK: - Drink
struct Drink2: Codable {
  let strDrink: String
  let strDrinkThumb: String
  let idDrink: String
}

