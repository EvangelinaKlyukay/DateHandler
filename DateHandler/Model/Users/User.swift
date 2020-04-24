//
//  User.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 04.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class User {
        
    var name: String?
    var phone: String?
    var website: String?
    var email: String?
    var userId: Int
    
    init(data: [String: Any]) {
        
        self.name = data["name"] as? String
        self.phone = data["phone"] as? String
        self.website = data["website"] as? String
        self.email = data["email"] as? String
        self.userId = (data["userId"] as? Int)!
    }
}
 
