//
//  AddTicketViewController.swift
//  Flight-Hedge.iO
//
//  Created by Austin Potts on 7/26/23.
//

import UIKit

class AddTicketViewController: UIViewController {
    
    var ticket: Ticket?
    
    
    @IBOutlet weak var terminalNumberTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var arrivalTimeTextField: UITextField!
    @IBOutlet weak var departTimeTextField: UITextField!
    @IBOutlet weak var arrivingToTextField: UITextField!
    @IBOutlet weak var departFromTextField: UITextField!
    
    @IBOutlet weak var departFromView: UIView!
    @IBOutlet weak var arrivingToView: UIView!
    @IBOutlet weak var departTimeView: UIView!
    @IBOutlet weak var arrivalTimeView: UIView!
    @IBOutlet weak var durationView: UIView!
    @IBOutlet weak var terminalView: UIView!
    @IBOutlet weak var addTicketView: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        departFromView.layer.cornerRadius = 5
        arrivingToView.layer.cornerRadius = 5
        departTimeView.layer.cornerRadius = 5
        arrivalTimeView.layer.cornerRadius = 5
        durationView.layer.cornerRadius = 5
        terminalView.layer.cornerRadius = 5
        addTicketView.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func addTicketTapped(_ sender: Any) {
        
        //Add Text Field Values to Ticket Model, then pass model back to previous view controller
        
        guard let departFrom = departFromTextField.text, let arrivingTo = arrivingToTextField.text, let departTime = departTimeTextField.text, let arrivalTime = arrivalTimeTextField.text, let duration = durationTextField.text, let terminalNumber = terminalNumberTextField.text else {return}
        
        let ticket = Ticket(departFrom: departFrom, arrivalTo: arrivingTo, departTime: departTime, arrivalTime: arrivalTime, terminal: terminalNumber)
        print("TICKET ADDED -> \(ticket.arrivalTime)")
        
        self.ticket = ticket
        
        print("TICKET ADDED -> \(ticket.departTime)")
        
        
        
    }
    
}
