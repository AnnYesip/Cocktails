//
//  DownloadMethod.swift
//  Cocktails
//
//  Created by Ann Yesip on 28.05.2021.
//

import Foundation

class Download{
  
  let coreDataManager = CoreDataManager()
  var networkManager = NetworkManager()
  
  //MARK: AlcoholicData -
  func downloadAlcoholicDataCocktails(completion: @escaping () -> Void) {
    coreDataManager.deleteAllData()
    let queue = DispatchQueue(label: "images", qos: .utility)
    
    self.networkManager.fetchData(for: .alcoholic) { [unowned self] (cocktails) in
      cocktails.forEach { (drink) in
        guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
        queue.async {
          guard let data = try? Data(contentsOf: imageUrl) else { return }
          DispatchQueue.main.async {
            coreDataManager.saveAlcoholicCocktails(drink.strDrink, image: data, id: drink.idDrink, strInstructions: drink.strInstructions ?? "рецепт отсутствует")
            completion()
          }
        }
      }
    }
  }
  //MARK: NonAlcoholicData -
  func downloadNonAlcoholicDataCocktails(completion: @escaping () -> Void) {
    coreDataManager.deleteAllData()
    let queue = DispatchQueue(label: "images", qos: .utility)
    
    self.networkManager.fetchData(for: .nonAlcoholic) { [unowned self] (cocktail) in
      cocktail.forEach { (drink) in
        guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
        queue.async {
          guard let data = try? Data(contentsOf: imageUrl) else { return }
          DispatchQueue.main.async {
            coreDataManager.saveNonAlcoholicCocktails(drink.strDrink, image: data, id: drink.idDrink, strInstructions: drink.strInstructions ?? "рецепт отсутствует")
            completion()
            
          }
        }
      }
    }
  }
  
  //MARK: Recommended Cocktail Data -
  func downloadRecommendedCocktails(completion: @escaping () -> Void) {
    coreDataManager.deleteAllData()
    let queue = DispatchQueue(label: "images", qos: .utility)
    
    self.networkManager.fetchData(for: .random) { [unowned self] (cocktail) in
      cocktail.forEach { (drink) in
        guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
        queue.async {
          guard let data = try? Data(contentsOf: imageUrl) else { return }
          DispatchQueue.main.async {
            coreDataManager.saveRecommendedCocktails(drink.strDrink, image: data, id: drink.idDrink, strInstructions: drink.strInstructions ?? "рецепт отсутствует")
            completion()
            
          }
        }
      }
    }
  }
  
  //MARK: SearchByIdCocktail Data -
  func downloadSearchByIdCocktails(id: String, completion: @escaping () -> Void) {
    coreDataManager.deleteSerchbyIdCocktail()
    let queue = DispatchQueue(label: "images", qos: .utility)
    
    self.networkManager.fetchDataById(id: id) { cocktail in
      cocktail.forEach { (drink) in
        guard let imageUrl = URL(string: drink.strDrinkThumb) else { return }
        queue.async {
          guard let data = try? Data(contentsOf: imageUrl) else { return }
          DispatchQueue.main.async {
            self.coreDataManager.saveSearchByIdCocktail(drink.strDrink,
                                                        image: data,
                                                        id: drink.idDrink,
                                                        strAlcoholic: drink.strAlcoholic ?? "category not specified",
                                                        strInstructions: drink.strInstructions ?? "рецепт отсутствует",
                                                        strIngredient1: drink.strIngredient1 ?? "ингредиент отсутствует",
                                                        strIngredient2: drink.strIngredient2 ?? "ингредиент отсутствует",
                                                        strIngredient3: drink.strIngredient3 ?? "ингредиент отсутствует",
                                                        strIngredient4: drink.strIngredient4 ?? "ингредиент отсутствует",
                                                        strIngredient5: drink.strIngredient5 ?? "ингредиент отсутствует",
                                                        strIngredient6: drink.strIngredient6 ?? "ингредиент отсутствует",
                                                        strIngredient7: drink.strIngredient7 ?? "ингредиент отсутствует",
                                                        strIngredient8: drink.strIngredient8 ?? "ингредиент отсутствует",
                                                        strIngredient9: drink.strIngredient9 ?? "ингредиент отсутствует",
                                                        strIngredient10: drink.strIngredient10 ?? "ингредиент отсутствует",
                                                        strIngredient11: drink.strIngredient11 ?? "ингредиент отсутствует",
                                                        strIngredient12: drink.strIngredient12 ?? "ингредиент отсутствует",
                                                        strIngredient13: drink.strIngredient13 ?? "ингредиент отсутствует",
                                                        strIngredient14: drink.strIngredient14 ?? "ингредиент отсутствует",
                                                        strIngredient15: drink.strIngredient15 ?? "ингредиент отсутствует",
                                                        strMeasure1: drink.strMeasure1 ?? "мера отсутствует",
                                                        strMeasure2: drink.strMeasure2 ?? "мера отсутствует",
                                                        strMeasure3: drink.strMeasure3 ?? "мера отсутствует",
                                                        strMeasure4: drink.strMeasure4 ?? "мера отсутствует",
                                                        strMeasure5: drink.strMeasure5 ?? "мера отсутствует",
                                                        strMeasure6: drink.strMeasure6 ?? "мера отсутствует",
                                                        strMeasure7: drink.strMeasure7 ?? "мера отсутствует",
                                                        strMeasure8: drink.strMeasure8 ?? "мера отсутствует",
                                                        strMeasure9: drink.strMeasure9 ?? "мера отсутствует",
                                                        strMeasure10: drink.strMeasure10 ?? "мера отсутствует",
                                                        strMeasure11: drink.strMeasure11 ?? "мера отсутствует",
                                                        strMeasure12: drink.strMeasure12 ?? "мера отсутствует",
                                                        strMeasure13: drink.strMeasure13 ?? "мера отсутствует",
                                                        strMeasure14: drink.strMeasure14 ?? "мера отсутствует",
                                                        strMeasure15: drink.strMeasure15 ?? "мера отсутствует")
            completion()
          }
        }
      }
    }
  }
  
  
}
