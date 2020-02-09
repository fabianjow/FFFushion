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
    
    var foodcontroller:FoodController = FoodController()
    var food:[Food] = []
    var cart:[Food] = []
    var sum = Int16()
    
    
    @IBOutlet weak var totalLB: UILabel!
    
    @IBAction func checkoutBtn(_ sender: Any) {
        
        
        cart = foodcontroller.retrieveAllFood()
        for i in cart {
            foodcontroller.checkout(name: i.namE)
        }
        let storyboard = UIStoryboard(name: "Content", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartTV") as UIViewController
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action) -> Void in
            self.navigationController?.show(vc, sender: self)})
        let cancelAction = UIAlertAction(title: "Cancel", style: . cancel) { (alert: UIAlertAction!) -> Void in
             print("Just dismissing the Alert Controller.")
        }
        let alertController:UIAlertController = UIAlertController(title: "Message", message: "Do you want to check out? ", preferredStyle: UIAlertController.Style.alert)
        
        
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
//        let storyboard = UIStoryboard(name: "Content", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "mapviewvc") as UIViewController
//        vc.modalPresentationStyle = .fullScreen
//        present(vc,animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        food = foodcontroller.retrieveAllFood()
               
       for i in food {
        sum += i.amounT
       }
        totalLB.text! = "$ " + "\(sum)"
        
    }
    
    
    
    
}
