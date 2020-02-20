//
//  ViewController.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 20.02.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import UIKit

class UserViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        let alertVC = UIAlertController(title: "Заполните поля", message: "", preferredStyle: .alert)
        
        alertVC.addTextField { (textField) in
            textField.placeholder = "Имя"
        }
        alertVC.addTextField { (textField) in
            textField.placeholder = "Телефон"
        }
        alertVC.addTextField { (textField) in
            textField.placeholder = "Сайт"
        }
        alertVC.addTextField { (textField) in
            textField.placeholder = "Email"
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { (_) -> Void in
        }
        let submitAction = UIAlertAction(title: "Сохранить", style: .default, handler: {
            (alert) -> Void in
        })
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(submitAction)
        alertVC.view.tintColor = UIColor.black
        present(alertVC, animated: true)
            
    }
}

