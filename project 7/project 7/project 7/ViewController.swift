//
//  ViewController.swift
//  project 7
//
//  Created by Павел Тимофеев on 24.04.2021.
//

import UIKit

class ViewController: UITableViewController {
var pettions = [Petition] ()
    override func viewDidLoad() {
        super.viewDidLoad()
let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            pettions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return pettions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        return cell
    }
}

