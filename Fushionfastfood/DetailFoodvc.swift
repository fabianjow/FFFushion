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

    @IBOutlet weak var amtLB: UILabel!
    @IBOutlet weak var foodLB: UILabel!
    @IBAction func addtocartBTN(_ sender: Any) {
//        let item = Food(name: foodLB.text!, amount: amtLB.text!, imagename: <#T##String#>)
        let storyboard = UIStoryboard(name: "Content", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Cart") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true, completion: nil)
    }
    
    var getname = String()
    var getamt = Int16()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        foodLB.text! = getname
//        amtLB.text! = getamt
        
    }
   
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    
    }
}
