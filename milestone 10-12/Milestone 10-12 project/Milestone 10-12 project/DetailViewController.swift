//
//  DetailViewController.swift
//  Milestone 10-12 project
//
//  Created by Павел Тимофеев on 29.05.2021.
//

import UIKit

class DetailViewController: UIViewController {
    var path: URL?
    @IBOutlet var image: UIImageView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = path {
            image.image = UIImage(contentsOfFile: imageToLoad.path)
        
        }
    }
    


}

