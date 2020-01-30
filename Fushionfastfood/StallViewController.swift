//
//  StallViewController.swift
//  Fushionfastfood
//
//  Created by Fabian on 30/1/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import Foundation
import UIKit
import MapKit
class StallViewController: UIViewController{
    
    
    @IBAction func viewmapBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Mapv", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Mapv") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    



}
