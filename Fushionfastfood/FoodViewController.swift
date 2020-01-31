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

class ContactController {
    
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
                let amount = c.value(forKeyPath: "amount") as! int_fast32_t
                let imageName = c.value(forKeyPath: "imageName") as! String
                //print("\(firstname!) \(lastname!), \(mobileno!)")
                foodlist.append(Food(name: name, amount: amount, imagename: imageName))
            }
            
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return foodlist
        
    }
    
    
}
