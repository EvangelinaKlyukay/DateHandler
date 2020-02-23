//
//  User.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 22.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class User: CustomStringConvertible {
    
    let id: Int
    let name: String
    let phone: String
    let website: String
    let email: String
    
    init(withId id: Int, name: String, phone: String, website: String, email: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.website = website
        self.email = email
    }
    
    var description: String {
        return "id: \(id); name: \(name); phone: \(phone); website: \(website); email: \(email)"
    }
    
}
