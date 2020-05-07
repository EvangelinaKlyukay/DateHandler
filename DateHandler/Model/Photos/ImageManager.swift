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
    private var images = [UserImage]()
    
    init(network: NetworkManager) {
        
        self.network = network
        
    }
    
    func get(albumByIndex index: Int) -> UserImage? {
        return images[index]
    }
    
    func getImagesCount() -> Int {
        return images.count
    }
    
    func loadImage(albumId: Int) {
        self.network.request(path: "/albums/\(albumId)/photos", parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            
            var images: [UserImage] = []
            
            response.forEach {
                let image: UserImage = UserImage(data: $0)
                images.append(image)
            }
            self.images = images
            self.delegate?.photosUpdated(sender: self)
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
}
