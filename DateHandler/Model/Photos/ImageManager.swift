//
//  ImageManager.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 24.04.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

protocol ImageManagerDelegate: class {
    
    func photosUpdated(sender: ImageManager)
    
}

class ImageManager {
    
    weak var delegate: ImageManagerDelegate?
    
    private let network: NetworkManager
    
    init(network: NetworkManager) {
        
        self.network = network
        
    }
 
    func loadImages(album: UserAlbum!) {
        if album.id == nil {
            print("UserAlbum.id is nil")
            return
        }
        
        let albumId = album.id!
        
        self.network.request(path: "/albums/\(albumId)/photos", parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            
            var images: [UserImage] = []
            
            response.forEach {
                let image: UserImage = UserImage(data: $0)
                images.append(image)
            }
            album.set(images: images)
            self.delegate?.photosUpdated(sender: self)
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
}
