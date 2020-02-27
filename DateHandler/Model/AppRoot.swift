//
//  AppRoot.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 26.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

public class AppRoot {
    
    private static let serverAddress = "https://jsonplaceholder.typicode.com"
    
    public static let shared = AppRoot()
    
    public let users: UserManager
    
    private let network: NetworkManager?
    
    private init() {
        if let serverUrl = URL(string: AppRoot.serverAddress) {
            network = NetworkManager(serverUrl: serverUrl)
        } else {
            network = nil
            print("Can't initialize network with url:", AppRoot.serverAddress)
        }
        
        users = UserManager(network: network!)
    }
    
}
