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

    @IBOutlet var foodLB: UIView!
    @IBOutlet weak var amtLB: UILabel!
    
    @IBAction func addtocartBTN(_ sender: Any) {
    }
    
    var getname = String()
    var getamt = Int16()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    
    }
}
