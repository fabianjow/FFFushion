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
    @IBOutlet weak var logOut: UIBarButtonItem!
    
    
    //var dataDescription:Profile = Profile(username: "", email: "", mobileno: "")
    private var usersCollectionRef: CollectionReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersCollectionRef = Firestore.firestore().collection("users")
        
        handleFetchUser()
        
        userNameFld.text = ""
        emailFld.text = ""
        mobileNoFld.text = ""
//        let db = Firestore.firestore().collection("users").document("Test")
//        db.getDocument { (document, error) in
//            if let document = document, document.exists {
//                self.dataDescription = Profile(username: document.data()?["username"] as! String, email: document.data()?["email"] as! String, mobileno: document.data()?["mobileno"] as! String)
//                print (document.data()?["username"] as! String)
//            }
//
//            self.userNameFld.text = self.dataDescription.userName
//            self.emailFld.text = self.dataDescription.Email
//            self.mobileNoFld.text = self.dataDescription.mobileNo
//
//        }
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
                        
                    self.userNameFld.text = newProfile.userName
                    self.emailFld.text = newProfile.Email
                    self.mobileNoFld.text = newProfile.mobileNo
                    
                }
            }
        
        
        }
    }
    @IBAction func logOut(_ sender: Any) {
        logoutButtonTapped()
    }
    
    @objc func logoutButtonTapped(){
        let auth = Auth.auth()
        
        do {
            try auth.signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(identifier: "Login") as UIViewController
                          vc.modalPresentationStyle = .fullScreen
                          present(vc, animated: true, completion: nil)
        } catch let err as NSError {
            print("Error signing out: %@", err)
        }
    }
    
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(true)
    }
}
