//
//  ViewController.swift
//  milestone 4-6
//
//  Created by Павел on 22.03.2021.
//  Copyright © 2021 Павел. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {


    var usedWord = [String] ()


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wish shopping list"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWord))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareMethod))
        
    }
    @objc func shareMethod() {
        if usedWord.isEmpty == false {
        let list = usedWord.joined(separator: "\n")
        let vc = UIActivityViewController(activityItems: [list], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
        } else {
            showErrorMessage(errortitle: "Your shopping list is empty!", erorMessage: "You should add some items.")
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWord.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingList", for: indexPath)
        cell.textLabel?.text = usedWord[indexPath.row]
        return cell
    }
    @objc func addWord() {
        let ac = UIAlertController(title: "Add new position in shopping list.", message: nil, preferredStyle: .alert)
        ac.addTextField () // добавление TextField в AlertController
        let submitAction = UIAlertAction(title: "Submit", style: .default) { // add button in alertController
            [weak self, weak ac] _ in // замыкания могут использовать их, го не создает сильный ссылочный цикл
            guard let item = ac?.textFields?[0].text else {return}
            self?.submit(item)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    func submit(_ item: String) {
  
        let lowerAnswer = item.lowercased()
    
        guard isOriginal(word: lowerAnswer) else {
     showErrorMessage(errortitle: "Word already used ", erorMessage: "Maybe you mean something ")
    return
}
        usedWord.insert(item.lowercased(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
         print(usedWord)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    func isOriginal (word: String) -> Bool {
        return !usedWord.contains(word)
            // проверяет, имеется ли данный метод в массиве
        
    }

        func showErrorMessage(errortitle: String, erorMessage: String) {
        let ac = UIAlertController(title: errortitle, message: erorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            usedWord.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

