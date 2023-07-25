//
//  HomeViewController.swift
//  Flight-Hedge.iO
//
//  Created by Austin Potts on 7/25/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var ticketView: UIView!
    @IBOutlet weak var insuranceQuoteView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }
    
    
    func setUpViews() {
        
        ticketView.layer.cornerRadius = 10
        ticketView.layer.shadowOpacity = 2
        
        insuranceQuoteView.layer.cornerRadius = 10
        insuranceQuoteView.layer.shadowOpacity = 2
        
        
        
    }

 

}
