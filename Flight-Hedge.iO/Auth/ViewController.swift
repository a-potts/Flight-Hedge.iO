//
//  ViewController.swift
//  Flight-Hedge.iO
//
//  Created by Austin Potts on 7/22/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth


class ViewController: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nameView: UIView!
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var loginButtonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
        loginButtonView.layer.cornerRadius = 10
        
    }

 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Check the segue identifier
        if segue.identifier == "Register" {
            
            //Unwrap the next viewController as the segues destination otherwsie return
            guard segue.destination is RegisterViewController else {return}
            //here is where you can say i.e nextViewController.apiController = thisFileApiController
            
        }
    }
    
    //Actions
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //Handle Firebase Login
        guard let email = nameText.text, let password = passwordText.text  else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            self.performSegue(withIdentifier: "LoggedIn", sender: self)
            
        }
    }
    
}

