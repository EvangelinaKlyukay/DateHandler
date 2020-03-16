//
//  User.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 04.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class User: CustomStringConvertible {
        
    var id: Int
    var name: String?
    var phone: String?
    var website: String?
    var email: String?
    
    init(withId id: Int, name: String, phone: String, website: String, email: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.website = website
        self.email = email
    }
    
    init(data: [String: Any]) {
        self.id = data["id"] as! Int
        self.name = data["name"] as? String
        self.phone = data["phone"] as? String
        self.website = data["website"] as? String
        self.email = data["email"] as? String
    }
    public var description: String {
        return "id: \(id); name: \(name ?? ""); phone: \(phone ?? ""); website: \(website ?? ""); email: \(email ?? "")"
    }
    
}
 
