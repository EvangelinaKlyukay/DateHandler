//
//  AppRoot.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 26.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation

class AppRoot {
    
    private static let serverAddress = "https://jsonplaceholder.typicode.com"
    
    public static let shared = AppRoot()
    
    var userManager: UserManager
    var albumManager: AlbumManager
    var imageManager: ImageManager
    
    private let network: NetworkManager?

    
    private init() {
        if let serverUrl = URL(string: AppRoot.serverAddress) {
            network = NetworkManager(serverUrl: serverUrl)
           
        } else {
            network = nil
          
            print("Can't initialize network with url:", AppRoot.serverAddress)
            
        }
        userManager = UserManager(network: network!)
        albumManager = AlbumManager(network: network!)
        imageManager = ImageManager(network: network!)
    }

 }
  
