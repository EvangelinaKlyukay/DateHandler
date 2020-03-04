//
//  UserCastomTableViewCell.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 25.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit
import MessageUI

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        phoneLabel.isUserInteractionEnabled = true
        websiteLabel.isUserInteractionEnabled = true
        emailLabel.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(clickLabel))
        tap.numberOfTapsRequired = 1
        
        let tap2 = UITapGestureRecognizer.init(target: self, action: #selector(clickLabel))
        tap.numberOfTapsRequired = 1
        
        let tap3 = UITapGestureRecognizer.init(target: self, action: #selector(clickLabel))
        tap.numberOfTapsRequired = 1
        
        phoneLabel.addGestureRecognizer(tap)
        websiteLabel.addGestureRecognizer(tap2)
        emailLabel.addGestureRecognizer(tap3)
   }
 
    @objc func clickLabel(sender:UITapGestureRecognizer) {
        print("hkjh")
    }

    func set(user: User) {
        idLabel.text = String(user.id)
        nameLabel.text = user.name
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
        emailLabel.text = user.email
    }
    
//    func configureMailController() -> MFMailComposeViewController {
//        let mailCompoerVC = MFMailComposeViewController()
//        mailCompoerVC.mailComposeDelegate = (self as! MFMailComposeViewControllerDelegate)
//        
//        mailCompoerVC.setToRecipients(["emailLabel"])
//        return mailCompoerVC
//    }
}
