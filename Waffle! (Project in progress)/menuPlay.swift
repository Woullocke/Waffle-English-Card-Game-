//
//  menuPlay.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 21.3.2024.
//

import UIKit
import CoreData

var stepperValuePlayer: Int16 = 1
var stepperValueRoom: Int16 = 1

struct Info {
    static var player = stepperValuePlayer
    static var room = stepperValueRoom
}


class menuPlay: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        processArrays() // создание или обновление БД
        
    }
    
    
    
    
    @IBAction func goMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func playButton(_ sender: Any) {
        print("Переход в игру")
    }
    
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
    
    @IBOutlet weak var numberPlayer: UILabel!
    
    @IBAction func stepperButtonPlayer(_ sender: UIStepper) { // работа с степпером
        let value = Int(sender.value)
        Info.player = Int16(value)
        print("Player: \(Info.player)")
        numberPlayer.text = "\(Info.player)"
    }
    
    
    

    @IBOutlet weak var numberRoom: UILabel!
    
    @IBAction func stepperButtonRoom(_ sender: UIStepper) {
        let value = Int(sender.value)
        Info.room = Int16(value)
        print("Room: \(Info.room)")
        numberRoom.text = "\(Info.room)"
    }
    
}

