//
//  UserImage.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 24.04.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class UserImage {
    
    let albumId: Int?
    let url: URL?
    let thumbnailUrl: URL?
    let title: String?
    
    init(data: [String: Any]) {
        self.albumId = data["albumId"] as? Int
        self.url = URL(string: data["url"] as! String)
        self.thumbnailUrl = URL(string: data["thumbnailUrl"] as! String)
        self.title = data["title"] as? String
    }
}
