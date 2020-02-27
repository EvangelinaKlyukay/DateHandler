//
//  ViewController.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 20.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class UsersScreenViewController: UITableViewController {
    
    private var userManager : UserManager {
        return AppRoot.shared.users
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerTableViewCells()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userManager.getUsersCount()
    }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получить пользователя по индексу ячейки
        let user = userManager.get(userByIndex: indexPath.row)
        
        // Получить ячейку у tableView
        let userCell = dequeueUserCell(fromTableView: tableView)!
        
        // Передать пользователя в ячейку
        if let user = user {
            userCell.set(user: user)
        }
        
        // Вернуть ячейку
        return userCell
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

    
}
