//
//  popUpWindow.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 28.4.2024.
//

import UIKit

class popUpWindow: UIViewController {
    
    @IBOutlet weak var situationLabel: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Подгрузка Ситуации
        
        let SituationL1ID: Int16 = lobbyData[0].situationID
        if let RoleId1 = StorageManager.shared.fetchSituationCards().first?.id,
           let Situation = StorageManager.shared.fetchSituationCard(with: SituationL1ID) {
            situationLabel.text = Situation.text
        } else {
            situationLabel.text = "No data available"
        }
        
        
        
        
        // Подгрузка Настроения
        
        let MoodL1ID: Int16 = lobbyData[0].moodID
        if let mood = StorageManager.shared.fetchMoods().first?.id,
           let Mood = StorageManager.shared.fetchMood(with: MoodL1ID) {
            moodLabel.text = Mood.text
        } else {
            moodLabel.text = "No data available"
        }
        
        
        
        
        
    }
}
