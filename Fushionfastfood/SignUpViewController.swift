//
//  SignUpViewController.swift
//  Fushionfastfood
//
//  Created by Fabian Jow on 7/2/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        hideKeyboardWhenTappedAround()
    }
    
    func setUpElements() {
    
        // Hide the error label
        errorLabel.alpha = 0
    }

      // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? {
        
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                   emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                   passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                    mobileTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                   
                   return "Please fill in all fields."
               }
        // Check if the password is secure
               let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               
               if Utilities.isPasswordValid(cleanedPassword) == false {
                   // Password isn't secure enough
                   return "Please make sure your password is at least 8 characters, contains a special character and a number."
               }
        
        return nil
    }

    @IBAction func signUpTapped(_ sender: Any) {
        // Validate the fields
               let error = validateFields()
        
        if error != nil {
                   
                   // There's something wrong with the fields, show error message
                   showError(error!)
               }
        else{
            let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                       let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                       let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let mobileNo = mobileTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the username, email and UID
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["username":username, "email":email, "mobileno":mobileNo, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToLogin()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToLogin() {
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyboard.instantiateViewController(identifier: "Login") as UIViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
           
       }
    
}

extension UIViewController{
    func hideKeyboardWhenTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
