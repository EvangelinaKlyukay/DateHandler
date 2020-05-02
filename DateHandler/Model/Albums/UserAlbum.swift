//
//  UserAlbum.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 04.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class UserAlbum {
    
    let userId: Int?
    let title: String?
    //let thumbnailUrl: URL?
   
    init(data: [String: Any]) {
        self.userId = data["userId"] as? Int
        self.title = data["title"] as? String
        //self.thumbnailUrl = URL(string: data["thumbnailUrl"] as! String)
    }
}


