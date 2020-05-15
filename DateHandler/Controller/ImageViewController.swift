//
//  ImageViewController.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 22.04.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit
import Foundation

class ImageViewController: UITableViewController, ImageManagerDelegate {
        
    var album: UserAlbum!
    
    func photosUpdated(sender: ImageManager) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        AppRoot.shared.imageManager.delegate = self
        AppRoot.shared.imageManager.loadImages(album: self.album)
            
    }
         
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.getImagesCount()
    }
        
                 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let image = album.get(imageIndex: indexPath.row)
                  
        let userCellImage = dequeueImageCell(fromTableView: tableView)!
                  
        if let image = image {
                    
            userCellImage.imageUser = image
                    
        }
                
        return userCellImage
    }
             
    func dequeueImageCell(fromTableView tableView: UITableView) -> ImageTableViewCell? {
        if let cellImage = tableView.dequeueReusableCell(withIdentifier: "Image") as? ImageTableViewCell {
            return cellImage
        }
        return nil
    }
    
}
