//
//  Settings.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 28.4.2024.
//

import UIKit

class Settings: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func vkButton(_ sender: Any) {
        if let url = URL(string: "https://vk.com/woullocke") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func githubButton(_ sender: Any) {
        if let url = URL(string: "https://github.com/Woullocke/Waffle-English-Card-Game-.git") {
            UIApplication.shared.open(url)
        }
    }
    
    
}
