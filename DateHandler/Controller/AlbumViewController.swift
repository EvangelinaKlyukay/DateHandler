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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           super.prepare(for: segue, sender: sender)
           let index = (sender as! IndexPath).row
           let image = AppRoot.shared.imageManager.get(albumByIndex: index)
           (segue.destination as! ImageViewController).image = image
       }
       
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           self.performSegue(withIdentifier: "showImage", sender: indexPath)
           
       }
    
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return AppRoot.shared.albumManager.getAlbumsCount()
          }
    
             
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

              let album = AppRoot.shared.albumManager.get(albumByIndex: indexPath.row)
              
              let userCellAlbum = dequeueAlbumCell(fromTableView: tableView)!
              
              if let album = album {
                userCellAlbum.album = album
              }
              
              return userCellAlbum
          }
         
    func dequeueAlbumCell(fromTableView tableView: UITableView) -> AlbumTableViewCell? {
              if let cellAlbum = tableView.dequeueReusableCell(withIdentifier: "Album") as? AlbumTableViewCell {
                  return cellAlbum
              }
              
              return nil
    }
}
