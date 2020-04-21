//
//  AlbumViewController.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 06.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation
import UIKit


class AlbumViewController: UITableViewController, AlbumManagerDelegate {
    
    var album: UserAlbum?
    
    func usersUpdated(sender: AlbumManager) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AppRoot.shared.albumManager.delegate = self
        
    }
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return AppRoot.shared.albumManager.getAlbumsCount()
          }
    
             
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

              let album = AppRoot.shared.albumManager.get(albumByIndex: indexPath.row)
              
              let userCellAlbum = dequeueUserCell(fromTableView: tableView)!
              
              if let album = album {
                userCellAlbum.album = album
              }
              
              return userCellAlbum
          }
         
    func dequeueUserCell(fromTableView tableView: UITableView) -> AlbumTableViewCell? {
              if let cellAlbum = tableView.dequeueReusableCell(withIdentifier: "Album") as? AlbumTableViewCell {
                  return cellAlbum
              }
              
              return nil
    }
}
