//
//  ViewController.swift
//  project 15
//
//  Created by Павел Тимофеев on 16.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var currentAnimation = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    @IBAction func tapped(_ sender: UIButton) {
        
        sender.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                break
            case 1:
                self.imageView.transform = .identity
            default:
                break
            }
        }) { finished in
            sender.isHidden = false
        }

        currentAnimation += 1
        
        if currentAnimation > 1 {
            currentAnimation = 0
        }
        
    }
    
}

