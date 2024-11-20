//
//  ExpensItem.swift
//  iExpense_SwiftData
//
//  Created by Jakub Czerwiec  on 15/11/2024.
//

import Foundation
import SwiftData

@Model
class ExpensItem {
    var id = UUID() // creates unice id
    let name: String
    let type: String
    let amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
