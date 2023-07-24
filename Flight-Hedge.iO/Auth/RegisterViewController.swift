//
//  RegisterViewController.swift
//  Flight-Hedge.iO
//
//  Created by Austin Potts on 7/24/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var registerButtonView: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailView.layer.cornerRadius = 10

        nameView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
        registerButtonView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
   
    
    
    func handleRegister(){
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            
        }
        
        
    }
    
    
    @IBAction func registerTapped(_ sender: Any) {
        handleRegister()
    }
    
    
//    private func registerUserIntoDatabaseWithUID(uid: String, values: [String: AnyObject]) {
//        // Successfully Registered Value
//             var ref: DatabaseReference!
//
//             ref = Database.database().reference(fromURL: "https://boatell-v2.firebaseio.com/")
//
//             let userRef = ref.child("users").child(uid)
//
////             let values = ["name": name, "email": email, "profileImageURL": metadata.downloadURL()]
//
//             userRef.updateChildValues(values) { (error, refer) in
//                 if let error = error {
//                     print("error child values: \(error)")
//                     return
//                 }
//
//                 print("Saved user successfully into firebase db")
//             }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
