//
//  CoreDataManager.swift
//  Cocktails
//
//  Created by Ann Yesip on 11.04.2021.
//

import UIKit
import CoreData

class CoreDataManager {
  let mainMOC = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  enum RequestType{
    case alcoholic
    case nonAlcoholic
  }
  
  
  //     MARK: -  save Cocktails
  
  func saveAlcoholicCocktails(_ name: String, image: Data, id: String, strInstructions: String) {
    
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "AlcoholicCocktails", in: mainMOC) else { return }
    let cocktail = NSManagedObject(entity: entityDescription, insertInto: mainMOC) as! AlcoholicCocktails
    cocktail.name = name
    cocktail.id = id
    cocktail.image = image
    cocktail.strInstructions = strInstructions
    
    do {
      try mainMOC.save()
    } catch let error as NSError {
      print(error)
    }
    
  }
  
  func saveNonAlcoholicCocktails(_ name: String, image: Data, id: String, strInstructions: String) {
    guard let secondEntityDescription = NSEntityDescription.entity(forEntityName: "NonAlcoholicCocktails", in: mainMOC) else { return }
    let secondCocktail = NSManagedObject(entity: secondEntityDescription, insertInto: mainMOC) as! NonAlcoholicCocktails
    secondCocktail.name = name
    secondCocktail.id = id
    secondCocktail.image = image
    secondCocktail.strInstructions = strInstructions
    do {
      try mainMOC.save()
    } catch let error as NSError {
      print(error)
    }
    
  }
  
  func saveRecommendedCocktails(_ name: String, image: Data, id: String, strInstructions: String) {
    guard let recommendedDescription = NSEntityDescription.entity(forEntityName: "Recommended", in: mainMOC) else { return }
    let recommended = NSManagedObject(entity: recommendedDescription, insertInto: mainMOC) as! Recommended
    recommended.name = name
    recommended.id = id
    recommended.image = image
    recommended.strInstructions = strInstructions
    
    do {
      try mainMOC.save()
    } catch let error as NSError {
      print(error)
    }
    
  }
  
//  func saveEntityForSearch(_ name: String, image: Data, id: String) {
//    guard let searchDescription = NSEntityDescription.entity(forEntityName: "EntityForSearch", in: mainMOC) else { return }
//    let search = NSManagedObject(entity: searchDescription, insertInto: mainMOC) as! EntityForSearch
//    search.name = name
//    search.id = id
//    search.image = image
//    
//    do {
//      try mainMOC.save()
//    } catch let error as NSError {
//      print(error)
//    }
//    
//  }
  
  
  
  func saveSearchByIdCocktail(_ name: String,
                              image: Data,
                              id: String,
                              strAlcoholic: String,
                              strInstructions: String,
                              strIngredient1: String,
                              strIngredient2: String,
                              strIngredient3: String,
                              strIngredient4: String,
                              strIngredient5: String,
                              strIngredient6: String,
                              strIngredient7: String,
                              strIngredient8: String,
                              strIngredient9: String,
                              strIngredient10: String,
                              strIngredient11: String,
                              strIngredient12: String,
                              strIngredient13: String,
                              strIngredient14: String,
                              strIngredient15: String,
                              strMeasure1: String,
                              strMeasure2: String,
                              strMeasure3: String,
                              strMeasure4: String,
                              strMeasure5: String,
                              strMeasure6: String,
                              strMeasure7: String,
                              strMeasure8: String,
                              strMeasure9: String,
                              strMeasure10: String,
                              strMeasure11: String,
                              strMeasure12: String,
                              strMeasure13: String,
                              strMeasure14: String,
                              strMeasure15: String) {
    guard let searchByIdDescription = NSEntityDescription.entity(forEntityName: "SearchById", in: mainMOC) else { return }
    let searchResults = NSManagedObject(entity: searchByIdDescription, insertInto: mainMOC) as! SearchById
    searchResults.name = name
    searchResults.id = id
    searchResults.image = image
    searchResults.strAlcoholic = strAlcoholic
    searchResults.strInstructions = strInstructions
    searchResults.strIngredient1 = strIngredient1
    searchResults.strIngredient2 = strIngredient2
    searchResults.strIngredient3 = strIngredient3
    searchResults.strIngredient4 = strIngredient4
    searchResults.strIngredient5 = strIngredient5
    searchResults.strIngredient6 = strIngredient6
    searchResults.strIngredient7 = strIngredient7
    searchResults.strIngredient8 = strIngredient8
    searchResults.strIngredient9 = strIngredient9
    searchResults.strIngredient10 = strIngredient10
    searchResults.strIngredient11 = strIngredient11
    searchResults.strIngredient12 = strIngredient12
    searchResults.strIngredient13 = strIngredient13
    searchResults.strIngredient14 = strIngredient14
    searchResults.strIngredient15 = strIngredient15
    
    searchResults.strMeasure1 = strMeasure1
    searchResults.strMeasure2 = strMeasure2
    searchResults.strMeasure3 = strMeasure3
    searchResults.strMeasure4 = strMeasure4
    searchResults.strMeasure5 = strMeasure5
    searchResults.strMeasure6 = strMeasure6
    searchResults.strMeasure7 = strMeasure7
    searchResults.strMeasure8 = strMeasure8
    searchResults.strMeasure9 = strMeasure9
    searchResults.strMeasure10 = strMeasure10
    searchResults.strMeasure11 = strMeasure11
    searchResults.strMeasure12 = strMeasure12
    searchResults.strMeasure13 = strMeasure13
    searchResults.strMeasure14 = strMeasure14
    searchResults.strMeasure15 = strMeasure15
    
    
    do {
      try mainMOC.save()
    } catch let error as NSError {
      print(error)
    }
    
  }
  
  
  //     MARK: -  fetch Cocktails
  
  func fetchCocktails() -> [AlcoholicCocktails] {
    let fetchRequest: NSFetchRequest<AlcoholicCocktails> = AlcoholicCocktails.fetchRequest()
    
    do {
      let cocktails = try mainMOC.fetch(fetchRequest)
      return cocktails
    } catch let error as NSError {
      print(error)
    }
    return []
  }
  
  func fetchNonAlcoholicCocktails() -> [NonAlcoholicCocktails] {
    let fetchRequest: NSFetchRequest<NonAlcoholicCocktails> = NonAlcoholicCocktails.fetchRequest()
    
    do {
      let cocktails = try mainMOC.fetch(fetchRequest)
      return cocktails
    } catch let error as NSError {
      print(error)
    }
    return []
  }
  
  func fetchRecommendedCocktails() -> [Recommended] {
    let fetchRequest: NSFetchRequest<Recommended> = Recommended.fetchRequest()
    
    do {
      let cocktails = try mainMOC.fetch(fetchRequest)
      return cocktails
    } catch let error as NSError {
      print(error)
    }
    return []
  }
  
  
  func fetchSearchByIdCocktail() -> [SearchById] {
    let fetchRequest: NSFetchRequest<SearchById> = SearchById.fetchRequest()
    
    do {
      let cocktails = try mainMOC.fetch(fetchRequest)
      return cocktails
    } catch let error as NSError {
      print(error)
    }
    return []
  }
  
//  func fetchCocktailsForSearch() -> [EntityForSearch] {
//    let fetchRequest: NSFetchRequest<EntityForSearch> = EntityForSearch.fetchRequest()
//
//    do {
//      let cocktails = try mainMOC.fetch(fetchRequest)
//      return cocktails
//    } catch let error as NSError {
//      print(error)
//    }
//    return []
//  }
  
  
  
  //     MARK: -  delete Cocktails
  func deleteAllData() {
    //      delete Alcoholic Cocktails
    let fetchRequest: NSFetchRequest<AlcoholicCocktails> = AlcoholicCocktails.fetchRequest()
    
    do {
      let cocktails = try mainMOC.fetch(fetchRequest)
      for item in cocktails {
        mainMOC.delete(item)
      }
      try mainMOC.save()
    } catch let error as NSError {
      print(error)
    }
    //      delete Non-Alcoholic Cocktails
    let secondFetchRequest: NSFetchRequest<NonAlcoholicCocktails> = NonAlcoholicCocktails.fetchRequest()
    
    do {
      let cocktails = try mainMOC.fetch(secondFetchRequest)
      for item in cocktails {
        mainMOC.delete(item)
      }
      try mainMOC.save()
    } catch let error as NSError {
      print(error)
    }
    


    
    
    
  }
  //      delete Recommended Cocktails
  func deleteRecommendedCocktails(){
    let fetchRecommendedCocktailsRequest: NSFetchRequest<Recommended> = Recommended.fetchRequest()
    
    do {
      let cocktails = try mainMOC.fetch(fetchRecommendedCocktailsRequest)
      for item in cocktails {
        mainMOC.delete(item)
      }
      try mainMOC.save()
    } catch let error as NSError {
      print(error)
    }
  }
  
  
  func deleteSerchbyIdCocktail() {
    //      delete Search By Id Cocktails
    let fetchRequest: NSFetchRequest<SearchById> = SearchById.fetchRequest()
    
    do {
      let cocktails = try mainMOC.fetch(fetchRequest)
      for item in cocktails {
        mainMOC.delete(item)
      }
      try mainMOC.save()
    } catch let error as NSError {
      print(error)
    }
  }
  
//  func deleteSerchCocktails() {
//    //      delete Search By  Cocktails
//    let fetchRequest: NSFetchRequest<EntityForSearch> = EntityForSearch.fetchRequest()
//
//    do {
//      let cocktails = try mainMOC.fetch(fetchRequest)
//      for item in cocktails {
//        mainMOC.delete(item)
//      }
//      try mainMOC.save()
//    } catch let error as NSError {
//      print(error)
//    }
//  }

  
  
  
  deinit {
    print("deallocating \(self)")
  }
}
