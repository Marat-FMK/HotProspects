//
//  Prospect.swift
//  HotProspects
//
//  Created by Marat Fakhrizhanov on 15.11.2024.
//

import SwiftData
import Foundation

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var date: Date
    
    init(name: String, emailAddress: String, isContacted: Bool, date: Date) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.date = date
    }
    
}
