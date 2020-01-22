//
//  ViewController.swift
//  Fushionfastfood
//
//  Created by Fabian Jow on 14/1/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func loginBtn(_ sender: Any) {
        
        if true {
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Content") as UIViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.  
    }
    

// test 1 
}

