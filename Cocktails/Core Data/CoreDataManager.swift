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
  
  func saveSearchByIdCocktail(_ name: String, image: Data, id: String, strInstructions: String) {
    guard let searchByIdDescription = NSEntityDescription.entity(forEntityName: "SearchById", in: mainMOC) else { return }
    let searchResults = NSManagedObject(entity: searchByIdDescription, insertInto: mainMOC) as! SearchById
    searchResults.name = name
    searchResults.id = id
    searchResults.image = image
    searchResults.strInstructions = strInstructions
    
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
    //      delete Recommended Cocktails
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
  
  deinit {
    print("deallocating \(self)")
  }
}
