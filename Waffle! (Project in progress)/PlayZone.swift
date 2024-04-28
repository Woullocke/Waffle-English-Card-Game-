//
//  PlayZone.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 5.3.2024.
//

import UIKit

var lobbyData: [(roomID: Int16, situationID: Int16, moodID: Int16, playerID: Int16, roleID: Int16, aCardID1: Int16, aCardID2: Int16, aCardID3: Int16, aCardID4: Int16, aCardID5: Int16)] = []

class PlayZone: UIViewController {
    
    // объявление изображений карт
    @IBOutlet weak var aCard1: UIImageView!
    @IBOutlet weak var aCard2: UIImageView!
    @IBOutlet weak var aCard3: UIImageView!
    @IBOutlet weak var aCard4: UIImageView!
    
    @IBOutlet weak var rCard: UILabel!
    
    @IBOutlet weak var aCardLabel1: UILabel!
    @IBOutlet weak var aCardLabel2: UILabel!
    @IBOutlet weak var aCardLabel3: UILabel!
    @IBOutlet weak var aCardLabel4: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let lobbyRecord = StorageManager.shared.lobbyfinder(playerID: Info.player, roomID: Info.room) {
            // Извлекаем данные из объекта Lobby
            let roomID = lobbyRecord.roomID
            let situationID = lobbyRecord.situationID
            let moodID = lobbyRecord.moodID
            let playerID = lobbyRecord.playerID
            let roleID = lobbyRecord.roleID
            let aCardID1 = lobbyRecord.aCardID1
            let aCardID2 = lobbyRecord.aCardID2
            let aCardID3 = lobbyRecord.aCardID3
            let aCardID4 = lobbyRecord.aCardID4
            let aCardID5 = lobbyRecord.aCardID5
            
            // Записываем извлеченные данные в массив lobbyData
            lobbyData.append((roomID, situationID, moodID, playerID, roleID, aCardID1, aCardID2, aCardID3, aCardID4, aCardID5))
        } else {
            print("Запись lobbyrecord не найдена")
        }
        
        print("Data: \(lobbyData)")


        
        
        
        
        // Подгрузка Роли
        
        let RoleL1ID: Int16 = lobbyData[0].roleID
        if let RoleId1 = StorageManager.shared.fetchRoles().first?.id,
           let role = StorageManager.shared.fetchRole(with: RoleL1ID) {
            rCard.text = role.text
        } else {
            rCard.text = "No data available"
        }
        
        
        
        
        // Подгрузка Активных карт
        
        
        let aCardL1ID: Int16 = lobbyData[0].aCardID1
        if let aCardLabelID = StorageManager.shared.fetchActiveCards().first?.id,
        let activeCard = StorageManager.shared.fetchActiveCard(with: aCardL1ID){
            aCardLabel1.text = activeCard.text
        } else {
            aCardLabel1.text = "No data available"
        }
        
        let aCardL2ID: Int16 = lobbyData[0].aCardID2
        if let aCardLabelID = StorageManager.shared.fetchActiveCards().first?.id,
        let activeCard = StorageManager.shared.fetchActiveCard(with: aCardL2ID){
            aCardLabel2.text = activeCard.text
        } else {
            aCardLabel2.text = "No data available"
        }
        
        let aCardL3ID: Int16 = lobbyData[0].aCardID3
        if let aCardLabelID = StorageManager.shared.fetchActiveCards().first?.id,
        let activeCard = StorageManager.shared.fetchActiveCard(with: aCardL3ID){
            aCardLabel3.text = activeCard.text
        } else {
            aCardLabel3.text = "No data available"
        }
        
        let aCardL4ID: Int16 = lobbyData[0].aCardID4
        if let aCardLabelID = StorageManager.shared.fetchActiveCards().first?.id,
        let activeCard = StorageManager.shared.fetchActiveCard(with: aCardL4ID){
            aCardLabel4.text = activeCard.text
        } else {
            aCardLabel4.text = "No data available"
        }
        
        }
    
    // функции смены изображения карт
    @IBAction func aCard1B(_ sender: Any) {
        aCard1.image = UIImage(named: "АктивнаяКартаЧБ")
    }
    @IBAction func aCard2B(_ sender: Any) {
        aCard2.image = UIImage(named: "АктивнаяКартаЧБ")
    }
    @IBAction func aCard3B(_ sender: Any) {
        aCard3.image = UIImage(named: "АктивнаяКартаЧБ")
    }
    @IBAction func aCard4B(_ sender: Any) {
        aCard4.image = UIImage(named: "АктивнаяКартаЧБ")
    }
    
    
    
    @IBAction func updateActiveButton(_ sender: Any) {
        
        // генерация случайных чисел
        lobbyData[0].aCardID1 = Int16(arc4random_uniform(103)) + 1
        lobbyData[0].aCardID2 = Int16(arc4random_uniform(103)) + 1
        lobbyData[0].aCardID3 = Int16(arc4random_uniform(103)) + 1
        lobbyData[0].aCardID4 = Int16(arc4random_uniform(103)) + 1
        lobbyData[0].aCardID5 = Int16(arc4random_uniform(103)) + 1
        
        aCard1.image = UIImage(named: "Карта")
        aCard2.image = UIImage(named: "Карта")
        aCard3.image = UIImage(named: "Карта")
        aCard4.image = UIImage(named: "Карта")


        // Повторно загрузите данные о картах из хранилища
            let aCardL1ID: Int16 = lobbyData[0].aCardID1
            if let activeCard = StorageManager.shared.fetchActiveCard(with: aCardL1ID){
                aCardLabel1.text = activeCard.text
            } else {
                aCardLabel1.text = "No data available"
            }
            
            let aCardL2ID: Int16 = lobbyData[0].aCardID2
            if let activeCard = StorageManager.shared.fetchActiveCard(with: aCardL2ID){
                aCardLabel2.text = activeCard.text
            } else {
                aCardLabel2.text = "No data available"
            }
            
            let aCardL3ID: Int16 = lobbyData[0].aCardID3
            if let activeCard = StorageManager.shared.fetchActiveCard(with: aCardL3ID){
                aCardLabel3.text = activeCard.text
            } else {
                aCardLabel3.text = "No data available"
            }
            
            let aCardL4ID: Int16 = lobbyData[0].aCardID4
            if let activeCard = StorageManager.shared.fetchActiveCard(with: aCardL4ID){
                aCardLabel4.text = activeCard.text
            } else {
                aCardLabel4.text = "No data available"
            }

    }
    
    
    
    // функция кнопки назад
    @IBAction func goBack(_ sender: Any) {
        lobbyData.removeAll()
        print("Массив пусти \(lobbyData)")
        dismiss(animated: true, completion: nil)
        }
    
    

}
