//
//  ViewController.swift
//  Flight-Hedge.iO
//
//  Created by Austin Potts on 7/22/23.
//

import UIKit

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


    
    //Actions
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //Handle Firebase Login
    }
    
}

