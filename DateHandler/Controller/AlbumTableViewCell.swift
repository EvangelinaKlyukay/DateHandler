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
    @IBOutlet weak var albumImage: WebImageView!
    @IBOutlet weak var nameAlbum: UILabel!
    
    weak var album: UserAlbum? {
        didSet {
            userId.text = String(album!.userId)
            id.text = String(album!.id)
            nameAlbum.text = album?.title!
            //albumImage.load(url: album!.image!)
        }
    }
}
