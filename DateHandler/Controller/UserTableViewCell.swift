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
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    weak var user: User? {
        didSet {
        nameLabel.text = user!.name
        phoneLabel.text = user!.phone
        websiteLabel.text = user!.website
        emailLabel.text = user!.email
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        phoneLabel.isUserInteractionEnabled = true
        websiteLabel.isUserInteractionEnabled = true
        emailLabel.isUserInteractionEnabled = true
        
        let phoneTapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(phoneSelected))
        phoneTapRecognizer.numberOfTapsRequired = 1
        
        let websiteTapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(websiteSelected))
        phoneTapRecognizer.numberOfTapsRequired = 1
        
        let emailTapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(emailSelected))
        phoneTapRecognizer.numberOfTapsRequired = 1
        
        phoneLabel.addGestureRecognizer(phoneTapRecognizer)
        websiteLabel.addGestureRecognizer(websiteTapRecognizer)
        emailLabel.addGestureRecognizer(emailTapRecognizer)
   }
    
    @objc func phoneSelected(sender:UITapGestureRecognizer) {
        if let phone = user?.phone, let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    @objc func websiteSelected(sender:UITapGestureRecognizer) {
        
        if let website = user?.website, let url = URL(string: "http://\(website)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc func emailSelected(sender:UITapGestureRecognizer) {
        
       if let email = user?.email, let url = URL(string: "emailto:\(email)") {
             UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
