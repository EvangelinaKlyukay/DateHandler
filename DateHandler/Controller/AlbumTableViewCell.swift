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
    @IBOutlet weak var AlbumImage: UIImageView!
    @IBOutlet weak var nameAlbum: UILabel!
    
    private weak var user: UserAlbum?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userId.isUserInteractionEnabled = true
        AlbumImage.isUserInteractionEnabled = true
        nameAlbum.isUserInteractionEnabled = true
      
    }
    
    func set(user: UserAlbum) {
        self.user = user
        
        userId.text = String(user.userId)
        nameAlbum.text = String(user.title!)
        AlbumImage.image = user.image
    
    }
}
