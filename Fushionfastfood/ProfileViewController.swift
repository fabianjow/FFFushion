//
//  ProfileViewController.swift
//  Fushionfastfood
//
//  Created by MAD2_P01 on 7/2/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func logout() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ViewController = storyboard.instantiateViewController(identifier: "login")
            present(ViewController,animated: true, completion: nil)
        }
    }
}
