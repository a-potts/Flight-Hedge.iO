//
//  Ticket.swift
//  Flight-Hedge.iO
//
//  Created by Austin Potts on 7/26/23.
//

import Foundation


class Ticket {
    
    var departFrom: String
    var arrivalTo: String
    var departTime: String
    var arrivalTime: String
    var terminal: String
    
    init(departFrom: String, arrivalTo: String, departTime: String, arrivalTime: String, terminal: String) {
        self.departFrom = departFrom
        self.arrivalTo = arrivalTo
        self.departTime = departTime
        self.arrivalTime = arrivalTime
        self.terminal = terminal
    }
    
    
}
