//
//  ImageManager.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 24.04.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

protocol ImageManagerDelegate: class {
    
    func usersUpdated(sender: ImageManager)
    
}

class ImageManager {
    
    weak var delegate: ImageManagerDelegate?
    
    private let network: NetworkManager
    private var images = [UserImage]()
    
    init(network: NetworkManager) {
    
        self.network = network
        self.network.request(path: "/albums/1/photos", parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            response.forEach {
                let image: UserImage = UserImage(data: $0)
                self.add(album: image)
            }
            self.delegate?.usersUpdated(sender: self)
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
    
    func get(albumByIndex index: Int) -> UserImage? {
        return images[index]
    }

    func getImagesCount() -> Int {
        return images.count
    }
    
    private func add(album: UserImage) {
        images.append(album)
    }
}
