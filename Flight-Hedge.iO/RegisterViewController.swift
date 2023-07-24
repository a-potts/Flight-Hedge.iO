//
//  RegisterViewController.swift
//  Flight-Hedge.iO
//
//  Created by Austin Potts on 7/24/23.
//

import UIKit
import Firebase

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
