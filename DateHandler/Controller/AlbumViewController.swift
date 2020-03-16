//
//  AlbumViewController.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 06.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation
import UIKit


class AlbumViewController: UITableViewController, AlbumManagerDelegate {
    func usersUpdated(sender: AlbumManager) {
          var window: UIWindow?
    }
    override func viewDidLoad() {
              super.viewDidLoad()
              
              self.registerTableViewCells()
              
              AppRoot.shared.albumManager.delegate = self
          }
          
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return AppRoot.shared.albumManager.getUsersCount()
          }
             
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              // Получение пользователя по индексу ячейки
              let user = AppRoot.shared.albumManager.get(userByIndex: indexPath.row)
              
              // Получение ячейки у tableView
              let userCellAlbum = dequeueUserCell(fromTableView: tableView)!
              
              // Передача пользователя в ячейку
              if let user = user {
                userCellAlbum.set(user: user)
              }
              
              // Везвращение ячейки
              return userCellAlbum
          }
          
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let destination = AlbumViewController()
            navigationController?.pushViewController(destination, animated: true)
          }
          
          func registerTableViewCells() {
              let textFieldCell = UINib(nibName: "AlbumTableViewCell", bundle: nil)
              self.tableView.register(textFieldCell, forCellReuseIdentifier: "AlbumTableViewCell")
          }
          
         
          func dequeueUserCell(fromTableView tableView: UITableView) -> AlbumTableViewCell? {
              if let cellAlbum = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell") as? AlbumTableViewCell {
                  return cellAlbum
              }
              
              return nil
    }

}
