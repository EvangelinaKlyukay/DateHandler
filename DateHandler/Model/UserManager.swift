//
//  UserManager.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 22.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class UserManager {
    
    private var userById: [Int: User] = [:]
    
    init() {
        for i in 0...10 {
            let user: User = User(withId: i, name: "user_\(i)", phone: String(i), website: "vk.com/id\(i)", email: "b\(i)@yandex.ru")
            add(user: user)
        }
        
    }
    
    func add(user: User) {
        userById[user.id] = user
    }
    
    func get(userById id: Int) -> User? {
        return userById[id]
    }
}
