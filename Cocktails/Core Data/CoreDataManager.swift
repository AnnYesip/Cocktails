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
    
    func saveAlcoholicCocktails(_ name: String, image: Data, id: String) {
        
            guard let entityDescription = NSEntityDescription.entity(forEntityName: "AlcoholicCocktails", in: mainMOC) else { return }
            let cocktail = NSManagedObject(entity: entityDescription, insertInto: mainMOC) as! AlcoholicCocktails
            cocktail.name = name
            cocktail.id = id
            cocktail.image = image

        do {
            try mainMOC.save()
        } catch let error as NSError {
            print(error)
        }
        
    }
    
    func saveNonAlcoholicCocktails(_ name: String, image: Data, id: String) {
            guard let secondEntityDescription = NSEntityDescription.entity(forEntityName: "NonAlcoholicCocktails", in: mainMOC) else { return }
            let secondCocktail = NSManagedObject(entity: secondEntityDescription, insertInto: mainMOC) as! NonAlcoholicCocktails
            secondCocktail.name = name
            secondCocktail.id = id
            secondCocktail.image = image

        do {
            try mainMOC.save()
        } catch let error as NSError {
            print(error)
        }
        
    }
    
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
    
    
    func deleteAllData() {
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
    
    
    deinit {
        print("deallocating \(self)")
    }
}
