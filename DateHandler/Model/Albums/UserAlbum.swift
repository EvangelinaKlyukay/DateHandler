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
    var title: String?
    var image: UIImage?
    
    init(withId userId: Int, title: String, image: UIImage) {
        self.userId = userId
        self.title = title
        self.image = image
          
       }
    
    init(data: [String: Any]) {
        self.userId = data["userId"] as! Int
           self.title = data["title"] as? String
           self.image = data["image"] as? UIImage
           
       }
    
    var description: String {
        return "userId: \(userId)title: \(title ?? ""); image: \(image)"
       }
    
}


