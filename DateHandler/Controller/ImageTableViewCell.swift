//
//  ImageTableViewCell.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 23.04.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet var nameImage: UILabel!
    @IBOutlet var albumImage: WebImageView!
    
      weak var imageUser: UserImage? {
            didSet {
                nameImage.text = imageUser?.title!
                albumImage.load(url: imageUser!.url!)
        }
    }
}
