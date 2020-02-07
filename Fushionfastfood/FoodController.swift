//
//  FoodViewController.swift
//  Fushionfastfood
//
//  Created by Fabian on 31/1/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FoodController {
    
    func retrieveAllFood ()->[Food] {
        var foodlist:[Food] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //this is the fetch request instead of the entity description one
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFood")
        
        do {
            let list:[NSManagedObject] = try context.fetch(fetchRequest)
            
            for c in list {
                let name = c.value(forKeyPath: "name") as! String
                let amount = c.value(forKeyPath: "amount") as! Int16
//                let imageName = c.value(forKeyPath: "imageName") as! UIImage
                //print("\(firstname!) \(lastname!), \(mobileno!)")
                foodlist.append(Food(name: name, amount: amount))
            }
            
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return foodlist
        
    }
    //Adding new food to the core data food 
    func addtoCart(newfood:Food){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //calling entity
        let entity = NSEntityDescription.entity(forEntityName: "CDFood", in: context)!
        
        // creating an object
        let food = NSManagedObject(entity: entity, insertInto: context)
        food.setValue(newfood.namE, forKey: "name")
        food.setValue(newfood.amounT, forKey: "amount")
//        person.setValue(newfood.imageName, forKey: "imageName")
        
        do {
            try context.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    // get the food from the core data so can display on the tableview cart
    func Retrievedfood() -> [Food] {
        var cartlist:[Food] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //fetch recipe
        let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "CDFood")
        do{
            let cdfood = try context.fetch(fetchrequest) as! [CDFood]
            for r in cdfood{
                cartlist.append(Food(name: r.name!, amount: r.amount))
            }
        }catch {
            print(error)
        }
        return cartlist
        
    }
    
    func deletefood(name:String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFood")
        fetchRequest.predicate = NSPredicate(format: "name = %@", name)
            do{
                let test = try context.fetch(fetchRequest)
                
                let objectToDelete = test[0]
                context.delete(objectToDelete)
                
                do{
                    try context.save()
                }
                catch{
                    print("Could not save. \(error)")
                }
            } catch {
                print("Could not delete. \(error)")
            }
        
    }
    
    
    
}
