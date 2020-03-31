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
    
    private var albums = [UserAlbum]()
    
    init() {
//        self.imageManager.request(path: "/photos", parameters: [:], onSuccess: { (response) in
//            if response.count == 0 {
//                return
//            }
//
//            response.forEach {
//                let user: UserAlbum = UserAlbum(data: $0)
//                self.add(user: user)
//            }
//            self.delegate?.usersUpdated(sender: self)
//
//        }, onFail: { (error) in
//            print(error.localizedDescription)
//        })
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
