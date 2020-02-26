//
//  UserCastomTableViewCell.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 25.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(user: User) {
        nameLabel.text = user.name
        idLabel.text = String(user.id)
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
        emailLabel.text = user.email
    }
}
