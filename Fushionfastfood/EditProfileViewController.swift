//
//  EditProfileViewController.swift
//  Fushionfastfood
//
//  Created by MAD2_P01 on 7/2/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mobileno: UITextField!
    
    private var usersCollectionRef: CollectionReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersCollectionRef = Firestore.firestore().collection("users")
        handleFetchUser()
    }
    
    @IBAction func saveprofile(_ sender: Any) {
        
       saveTapped()
        
    }
    
    @objc func handleFetchUser(){
        if Auth.auth().currentUser != nil{
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            usersCollectionRef.whereField("uid", isEqualTo: uid).getDocuments { (querySnapshot, error) in
                if let err = error{
                    debugPrint("Error fetching docs: \(err)")
                }else{
                    
                    let document = querySnapshot!.documents.first
                    
                    let newProfile = Profile(username: document?.data()["username"] as! String, email: document?.data()["email"] as! String, mobileno: document?.data()["mobileno"] as! String)
                    
                    self.username.text = newProfile.userName
                    self.email.text = newProfile.Email
                    self.mobileno.text = newProfile.mobileNo
                    
                }
            }
            
        }
    }
    
    func saveTapped(){
        if ((username.text != "" || email.text != "" || mobileno.text != "") && (username.text != nil || email.text != nil || mobileno.text != nil)){
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let userRef = usersCollectionRef.document(uid)
            
            if let new_username = username.text{
                
                
                userRef.updateData(["username": new_username]) { (error) in
                    if error != nil{
                        print("Error saving user data")
                    }
                }
            }
            if let new_email = email.text{
                
                Auth.auth().currentUser?.updateEmail(to: email.text!){ error in
                    
                    if error == nil{
                        userRef.updateData(["email": new_email]) { (error) in
                            if error != nil{
                                print("Error saving user data")
                            }
                        }
                    }
                    
                }
                
            }
            if let new_mobileno = mobileno.text{
                           
                           
                           userRef.updateData(["mobileno": new_mobileno]) { (error) in
                               if error != nil{
                                   print("Error saving user data")
                               }
                           }
                       }
            
            
            
            
        }
    }
    
    
}
