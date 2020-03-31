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
    
    var albumId: Int
    var title: String?
    var image: URL?
    
    init(withId albumId: Int, title: String, image: URL) {
        self.albumId = albumId
        self.title = title
        self.image = image
          
       }
    
    init(data: [String: Any]) {
           self.albumId = data["albumId"] as! Int
           self.title = data["title"] as? String
           self.image = (data["image"] as? URL)
           
       }
    
    var description: String {
        return "albumId: \(albumId); title: \(title ?? ""); image: \(image)"
    }
    
}


