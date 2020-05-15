//
//  UserAlbum.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 04.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class UserAlbum {
    
    let id: Int?
    let title: String?
    
    private var images: [UserImage]?
    
    init(data: [String: Any]) {
        
        self.id = data["id"] as? Int
        self.title = data["title"] as? String
    }
    
    var isImagesDownloaded: Bool {
        return images != nil
    }
    
    func set(images: [UserImage]) {
        self.images = images
    }
    
    func get(imageIndex index: Int) -> UserImage? {
        return images?[index]
    }
    
    func getImagesCount() -> Int {
        return images?.count ?? 0
    }
    
}


