//
//  User.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 04.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class User {
    
    let id: Int?
    let name: String?
    let phone: String?
    let website: String?
    let email: String?
    
    init(data: [String: Any]) {
        
        self.id = data["id"] as? Int
        self.name = data["name"] as? String
        self.phone = data["phone"] as? String
        self.website = data["website"] as? String
        self.email = data["email"] as? String
    }
}
 
