//
//  WebViewController.swift
//  Project 16
//
//  Created by Павел Тимофеев on 12.07.2021.
//

import UIKit
import WebKit


class WebViewController: UIViewController {
    
    
    @IBOutlet var webView: WKWebView!
    
    var website: String!
    
    override func viewDidLoad() {
        guard website != nil else {
        print("Website not set!")
            navigationController?.popViewController(animated: true)
            return
        }
        
        if let url = URL(string: website) {
            webView.load(URLRequest(url: url))
        }

    }
    
}

