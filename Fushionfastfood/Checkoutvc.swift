//
//  Checkoutvc.swift
//  Fushionfastfood
//
//  Created by Fabian on 7/2/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import Foundation
import UIKit
class Checkoutvc: UIViewController, UITableViewDelegate{
    
    // Variables
    var foodcontroller:FoodController = FoodController()
    var food:[Food] = []
    var cart:[Food] = []
    var sum = Int16()
    
    // Total Cost of Cart : IB-Label
    @IBOutlet weak var totalLB: UILabel!
    
    // Check out Button Fucntion
    // Runs the checkout function to delete everything from Core Data
    @IBAction func checkoutBtn(_ sender: Any) {
        
        // Calling the retrieveallfood function to get the Cart Food
        // Get the names of the food to run Checkout()
        cart = foodcontroller.retrieveAllFood()
        for i in cart {
            foodcontroller.checkout(name: i.namE)
        }
        
        // Setting storyboard to go to after Alert Action
        let storyboard = UIStoryboard(name: "Content", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartTV") as UIViewController
        // Alertaction OK (Go back to Cart)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action) -> Void in
            self.navigationController?.show(vc, sender: self)})
        // Alertaction Cancel
        let cancelAction = UIAlertAction(title: "Cancel", style: . cancel) { (alert: UIAlertAction!) -> Void in
             print("Just dismissing the Alert Controller.")
        }
        
        // AlertController
        let alertController:UIAlertController = UIAlertController(title: "Message", message: "Do you want to check out? ", preferredStyle: UIAlertController.Style.alert)
        
        
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // Display the total amount for Checkout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        food = foodcontroller.retrieveAllFood()
               
       for i in food {
        sum += i.amounT
       }
        totalLB.text! = "$ " + "\(sum)"
        
    }
    
    
    
    
}
