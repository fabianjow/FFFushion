//
//  DetailFoodvc.swift
//  Fushionfastfood
//
//  Created by Fabian on 5/2/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import Foundation
import UIKit

class DetailFoodvc: UIViewController, UITableViewDelegate{

    
    // Label Food Amount and Image for Each Item
    @IBOutlet weak var amtLB: UILabel!
    @IBOutlet weak var foodLB: UILabel!
    @IBOutlet weak var foodview: UIImageView!
    
    // Variables to retrieve from the App delegate
    var getname = String()
    var getamt = Int16()
    var getimg = UIImage()
    var foodselect:[Food] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Display the data on the view Controller
        foodLB.text! = getname
        amtLB.text! = "$ " + "\(getamt)"
        foodview.image = getimg
        
            }
    
    
    @IBAction func addtocartBTN(_ sender: Any) {
        
        // Passing data from vc to store in Core data
        let foodcontroller:FoodController = FoodController()
        let f:Food = Food(name: getname, amount:getamt)
               foodcontroller.addtoCart(newfood: f)

        // Alert message added to cart
                let alertController:UIAlertController = UIAlertController(title: "Message", message: "You have added " + foodLB.text! + " " + "to cart", preferredStyle: UIAlertController.Style.alert)
                let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
        
       
        
    }
   
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    
    }
}
