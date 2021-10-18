//
//  LocalDatabaseFavorite.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LocalDatabaseFavorite {
    init(){}
    
    func isFavoriteMovieExist(id: Int) -> Bool {
        guard let appDelegate   = UIApplication.shared.delegate as? AppDelegate else { return false }
        let managedContext      = appDelegate.persistentContainer.viewContext

        let fetchRequest        = NSFetchRequest<NSFetchRequestResult>(entityName: LDF.entityName.rawValue)
        fetchRequest.predicate  = NSPredicate(format: "id = \(id)")

        do {
            let results         = try managedContext.fetch(fetchRequest)
            if(results.count != 0){
                return true
            }
        }
        catch let error as NSError {
            print(error)
        }
        return false
    }
    
    func getListFavoriteMovie() -> [NSManagedObject]{
        guard let appDelegate   = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managedContext      = appDelegate.persistentContainer.viewContext
        let fetchRequest        = NSFetchRequest<NSFetchRequestResult>(entityName: LDF.entityName.rawValue)
        
        var object: [NSManagedObject] = []
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            object = results as? [NSManagedObject] ?? []
        }
        catch let error as NSError {
           print(error)
        }
        
        return object
    }
    
    func addFavoriteMovie(id: Int, image: String, title: String, releaseDate: String, overview: String){
        guard let appDelegate   = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext      = appDelegate.persistentContainer.viewContext
        let entityDescription   = NSEntityDescription.entity(forEntityName: LDF.entityName.rawValue, in: managedContext)!
        
        let managedObject = NSManagedObject(entity: entityDescription, insertInto: managedContext)
        managedObject.setValue(id, forKey: EntityFavorite.id.name)
        managedObject.setValue(image, forKey: EntityFavorite.image.name)
        managedObject.setValue(title, forKey: EntityFavorite.title.name)
        managedObject.setValue(releaseDate, forKey: EntityFavorite.releaseDate.name)
        managedObject.setValue(overview, forKey: EntityFavorite.overview.name)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func deleteFavoriteMovie(id: Int){
        guard let appDelegate   = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext      = appDelegate.persistentContainer.viewContext
        let fetchRequest        = NSFetchRequest<NSFetchRequestResult>(entityName: LDF.entityName.rawValue)
        fetchRequest.predicate  = NSPredicate(format: "id = \(id)")

        do {
            let results         = try managedContext.fetch(fetchRequest)
            
            for object in results {
                managedContext.delete(object as! NSManagedObject)
            }

            do {
                try managedContext.save()
            }
            catch {
                print("Failed to delete data")
            }
        }
        catch let error as NSError {
            print(error)
        }
    }
}
