//
//  AlbumManager.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 12.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

protocol AlbumManagerDelegate: class {
    
    func albumsUpdated(sender: AlbumManager)
    
}

class AlbumManager {
    
    weak var delegate: AlbumManagerDelegate?
    
    private let network: NetworkManager
    private var albums = [UserAlbum]()
    
    init(network: NetworkManager) {
        
        self.network = network
        
    }
    
    func get(albumByIndex index: Int) -> UserAlbum? {
        return albums[index]
    }
    
    func getAlbumsCount() -> Int {
        return albums.count
    }
    
    func loadAlbums(userId: Int) {
        self.network.request(path: "/users/\(userId)/albums" , parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            var albums: [UserAlbum] = []
            
            response.forEach {
                let album: UserAlbum = UserAlbum(data: $0)
                albums.append(album)
            }
            self.albums = albums
            self.delegate?.albumsUpdated(sender: self)
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
}
