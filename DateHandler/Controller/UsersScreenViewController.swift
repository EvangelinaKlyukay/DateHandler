//
//  ViewController.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 20.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit
import MessageUI

class UsersScreenViewController: UITableViewController, UserManagerDelegate {
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 140
        
        AppRoot.shared.userManager.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let index = (sender as! IndexPath).row
        let user = AppRoot.shared.userManager.get(userByIndex: index)
        (segue.destination as! AlbumViewController).userId = user!.id!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "showAlbum", sender: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppRoot.shared.userManager.getUsersCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = AppRoot.shared.userManager.get(userByIndex: indexPath.row)
        
        let userCell = dequeueUserCell(fromTableView: tableView)!
        
        if let user = user {
            userCell.user = user
        }
        
        return userCell
    }
    
    func dequeueUserCell(fromTableView tableView: UITableView) -> UserTableViewCell? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "User") as? UserTableViewCell {
            return cell
        }
        
        return nil
    }
    
    func usersUpdated(sender: UserManager) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

