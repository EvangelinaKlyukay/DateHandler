//
//  AlbumTableViewCell.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 04.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: WebImageView!
    @IBOutlet weak var nameAlbum: UILabel!
    
    weak var album: UserAlbum? {
        didSet {
            nameAlbum.text = album?.title!
            //albumImage.load(url: album!.thumbnailUrl!)
        }
    }
}
