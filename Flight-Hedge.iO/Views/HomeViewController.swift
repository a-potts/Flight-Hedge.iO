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
    
    @IBOutlet weak var ticketDetailsView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }
    
    
    func setUpViews() {
        
        ticketView.layer.cornerRadius = 7
        ticketView.layer.shadowOpacity = 2
        
        ticketDetailsView.layer.cornerRadius = 7
        
        insuranceQuoteView.layer.cornerRadius = 7
        insuranceQuoteView.layer.shadowOpacity = 2
        
        
        
    }

 

}
