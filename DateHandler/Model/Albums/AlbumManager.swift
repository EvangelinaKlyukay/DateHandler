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
    private var users = [UserAlbum]()
    
    init(network: NetworkManager) {
        
        self.network = network
        self.network.request(path: "/albums", parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            
            response.forEach {
                let user: UserAlbum = UserAlbum(data: $0)
                self.add(user: user)
            }
            self.delegate?.usersUpdated(sender: self)
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
    
    func get(userByIndex index: Int) -> UserAlbum? {
        return users[index]
    }

    func getUsersCount() -> Int {
        return users.count
    }
    
    private func add(user: UserAlbum) {
        users.append(user)
    }
    
    
}
