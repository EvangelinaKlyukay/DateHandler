//
//  User.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 22.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

public class User: CustomStringConvertible {
        
    var id: Int
    var name: String
    var phone: String
    var website: String
    var email: String
    
    init(withId id: Int, name: String, phone: String, website: String, email: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.website = website
        self.email = email
    }

    public var description: String {
        return "id: \(id); name: \(name); phone: \(phone); website: \(website); email: \(email)"
    }
    
}
