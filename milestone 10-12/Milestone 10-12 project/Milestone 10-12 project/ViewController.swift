//
//  ViewController.swift
//  Milestone 10-12 project
//
//  Created by Павел Тимофеев on 27.05.2021.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    var people = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
    }
    
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
//        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
 
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
             
        dismiss(animated: true)
        let ac = UIAlertController(title: "Add caption", message: nil, preferredStyle: .alert)
        ac.addTextField(configurationHandler: nil)
        ac.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self, weak ac] _ in
            let photo = Person(name: imageName, image: ac?.textFields![0].text ?? "No text added")
            self?.people.append(photo)
            self?.tableView.reloadData()
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(ac, animated: true, completion: nil)
    }
  
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        cell.textLabel?.text = people[indexPath.row].name
    return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            let somePick = people[indexPath.row]
            vc.path = getDocumentsDirectory().appendingPathComponent(somePick.name)
            navigationController?.pushViewController(vc, animated: true)

        }
        tableView.deselectRow(at: indexPath, animated: true)

    
    }
    

    
}

