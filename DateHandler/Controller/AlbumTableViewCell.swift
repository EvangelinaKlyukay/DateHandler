//
//  AlbumTableViewCell.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 04.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var nameAlbum: UILabel!
    
    private weak var album: UserAlbum?
    private weak var storage: ImageStorage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        storage = AppRoot.shared.storage
        
        userId.isUserInteractionEnabled = true
        id.isUserInteractionEnabled = true
        albumImage.isUserInteractionEnabled = true
        nameAlbum.isUserInteractionEnabled = true
      
    }
    
    func set(album: UserAlbum) {
        self.album = album
        
        userId.text = String(album.userId)
        id.text = String(album.id)
        nameAlbum.text = album.title!
        //albumImage.image = storage?.getImage(url: album.url!)
    }
}
