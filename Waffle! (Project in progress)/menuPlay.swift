//
//  menuPlay.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 21.3.2024.
//

import UIKit


class menuPlay: UIViewController {
    
    @IBAction func goMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func playButton(_ sender: Any) {
        print("Переход в игру")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        let value = Int(sender.value)
        numberPlayer.text = "\(value)"
    }
    
    @IBOutlet weak var numberPlayer: UILabel!
}
