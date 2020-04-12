//
//  UserAlbum.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 04.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation
import UIKit

class UserAlbum: CustomStringConvertible {
    
    var userId: Int
    var id: Int
    var title: String?
   
    
    init(withId id: Int, title: String, userId: Int) {
        self.userId = userId
        self.id = id
        self.title = title
        
          
       }
    
    init(data: [String: Any]) {
           self.userId = data["userId"] as! Int
           self.id = data["id"] as! Int
           self.title = data["title"] as? String
          
           
       }
    
    var description: String {
        return "userId: \(userId); id: \(id); title: \(title ?? "")"
    }
    
}


