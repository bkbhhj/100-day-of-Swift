//
//  TableViewController.swift
//  project 4
//
//  Created by Павел on 13.03.2021.
//  Copyright © 2021 Павел. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let tableViewController = UITableViewController(style: .plain)
    var allitem = ["apple.com", "hackingwithswift.com"] // масив
    var cellIndetificator = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableViewController.tableView) // добавление таблички на вью
        creteTableView()
    }
    // создаем метод для основных настроек
     func creteTableView () {
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndetificator)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.delegate = self

    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetificator, for: indexPath)
       
        let item = allitem[indexPath.row]
        cell.textLabel?.text = item
        return cell // создание ячейки в таблице

}


}
