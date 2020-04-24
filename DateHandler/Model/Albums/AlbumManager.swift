//
//  AlbumManager.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 12.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

protocol AlbumManagerDelegate: class {
    
    func usersUpdated(sender: AlbumManager)
    
}

class AlbumManager {
    
    weak var delegate: AlbumManagerDelegate?
    
    private let network: NetworkManager
    private var albums = [UserAlbum]()
    
    init(network: NetworkManager) {
    
        self.network = network
        self.network.request(path: "/users/\(userId)/albums" , parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            response.forEach {
                let album: UserAlbum = UserAlbum(data: $0)
                self.add(album: album)
            }
            self.delegate?.usersUpdated(sender: self)
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
    
    func get(albumByIndex index: Int) -> UserAlbum? {
        return albums[index]
    }

    func getAlbumsCount() -> Int {
        return albums.count
    }
    
    private func add(album: UserAlbum) {
        albums.append(album)
    }
    
}
