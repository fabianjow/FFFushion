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
    func addFoodtoCart(newfood:Food){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //calling entity
        let entity = NSEntityDescription.entity(forEntityName: "CDFood", in: context)!
        
        // creating an object
        let person = NSManagedObject(entity: entity, insertInto: context)
        person.setValue(newfood.namE, forKey: "name")
        person.setValue(newfood.amounT, forKey: "amount")
//        person.setValue(newfood.imageName, forKey: "imageName")
        
        
        do {
            try context.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
}
