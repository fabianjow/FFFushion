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
    
    @IBOutlet weak var userNameFld: UILabel!
    @IBOutlet weak var emailFld: UILabel!
    @IBOutlet weak var mobileNoFld: UILabel!
    var dataDescription:Profile = Profile(username: "", email: "", mobileno: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore().collection("users").document("Test")
        db.getDocument { (document, error) in
            if let document = document, document.exists {
                self.dataDescription = Profile(username: document.data()?["username"] as! String, email: document.data()?["email"] as! String, mobileno: document.data()?["mobileno"] as! String)
                print (document.data()?["username"] as! String)
            }
        
            self.userNameFld.text = self.dataDescription.userName
            self.emailFld.text = self.dataDescription.Email
            self.mobileNoFld.text = self.dataDescription.mobileNo
        
        }
    }
    
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(true)
    }
}
