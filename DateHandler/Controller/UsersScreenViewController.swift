//
//  ViewController.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 20.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class UsersScreenViewController: UITableViewController, UserManagerDelegate {
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerTableViewCells()
        
        AppRoot.shared.userManager.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppRoot.shared.userManager.getUsersCount()
    }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получение пользователя по индексу ячейки
        let user = AppRoot.shared.userManager.get(userByIndex: indexPath.row)
        
        // Получение ячейки у tableView
        let userCell = dequeueUserCell(fromTableView: tableView)!
        
        // Передача пользователя в ячейку
        if let user = user {
            userCell.set(user: user)
        }
        
        // Везвращение ячейки
        return userCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let destination = AlbumViewController()
      navigationController?.pushViewController(destination, animated: true)
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "UserCastomTableViewCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "UserCastomTableViewCell")
    }
    
   
    private func dequeueUserCell(fromTableView tableView: UITableView) -> UserTableViewCell? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCastomTableViewCell") as? UserTableViewCell {
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

