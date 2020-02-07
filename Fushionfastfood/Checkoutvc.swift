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
    var sum = Int16()
    
    
    @IBOutlet weak var totalLB: UILabel!
    
    @IBAction func checkoutBtn(_ sender: Any) {
        
        
        let alertController:UIAlertController = UIAlertController(title: "Message", message: "You have added " + "to cart", preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        alertController.addAction(alertAction)
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
