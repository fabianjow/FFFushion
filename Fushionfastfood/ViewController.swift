//
//  ViewController.swift
//  Fushionfastfood
//
//  Created by Fabian Jow on 14/1/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        // TODO: Validate Text Fields
               
               // Create cleaned versions of the text field
               let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
               // Signing in the user
               Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                   
                   if error != nil {
                       // Couldn't sign in
                       self.errorLabel.text = error!.localizedDescription
                       self.errorLabel.alpha = 1
                   }
                   else {
                       
                    self.transitionToHome()
                }
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
            setUpElements()
        }
    
    func setUpElements() {
           
           // Hide the error label
           errorLabel.alpha = 0
           
       }
    
    func transitionToHome() {
              
              let storyboard = UIStoryboard(name: "Content", bundle: nil)
             let vc = storyboard.instantiateViewController(identifier: "Content") as UIViewController
               vc.modalPresentationStyle = .fullScreen
               present(vc, animated: true, completion: nil)
              
          }
       
}


