//
//  UserManager.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 22.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

protocol UserManagerDelegate: class {
    
    func usersUpdated(sender: UserManager)
    
}

class UserManager {
    
    weak var delegate: UserManagerDelegate?
    
    private let network: NetworkManager
    private var users = [User]()
    
    init(network: NetworkManager) {
        self.network = network
        
        self.network.request(path: "/users", parameters: [:], onSuccess: { (response) in
            if response.count == 0 {
                return
            }
            
            response.forEach {
                let user: User = User(data: $0)
                self.add(user: user)
            }
            self.delegate?.usersUpdated(sender: self)
            
        }, onFail: { (error) in
            print(error.localizedDescription)
        })
    }
    
    func get(userByIndex index: Int) -> User? {
        return users[index]
    }

    func getUsersCount() -> Int {
        return users.count
    }
    
    private func add(user: User) {
        users.append(user)
    }
    
    
}
