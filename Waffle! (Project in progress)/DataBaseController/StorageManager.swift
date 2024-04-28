//
//  StorageManager.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 26.4.2024.
//

import UIKit
import CoreData

public final class StorageManager: NSObject{
    public static let shared = StorageManager()
    private override init() {}
    
    private var appDelegate: AppDelegate{
        UIApplication.shared.delegate as! AppDelegate
    }
    
    public var context: NSManagedObjectContext{
        appDelegate.persistentContainer.viewContext
    }
    
    
    // запись
    public func createRole(_ id: Int16, text: String) {
        guard let roleEntityDescription = NSEntityDescription.entity(forEntityName: "Role", in: context) else {return}
        
        let role = Role(entity: roleEntityDescription, insertInto: context)
        role.id = id
        role.text = text
        
        appDelegate.saveContext()
    }
    
    public func logCoreData(){
        if let url = appDelegate.persistentContainer.persistentStoreCoordinator.persistentStores.first?.url {
            print("BD url - \(url)")
        }
    }
    
    
    // чтение полного списка
    
    public func fetchRoles() -> [Role]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Role")
        do {
            return try context.fetch(fetchRequest) as! [Role]
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    public func fetchRole(with id: Int16) -> Role?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Role")
        do {
            guard let roles = try? context.fetch(fetchRequest) as? [Role] else {return nil}
            return roles.first(where: { $0.id == id })
        }
    }
    
    public func updateRole(with id: Int16, newText: String){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Role")
        do {
            guard let roles = try? context.fetch(fetchRequest) as? [Role],
                  let role = roles.first(where: { $0.id == id }) else {return}
            role.text = newText
        }
        appDelegate.saveContext()
    }
    
    public func deleteAllRole(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Role")
        do {
            let roles = try? context.fetch(fetchRequest) as? [Role]
            roles?.forEach{context.delete($0)}
        }
        appDelegate.saveContext()
    }
    
    public func deleteRole(with id: Int16){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Role")
        do {
            guard let roles = try? context.fetch(fetchRequest) as? [Role],
                  let role = roles.first(where: {$0.id == id}) else {return}
            context.delete(role)
        }
        appDelegate.saveContext()
    }
    
    
    // activeCard
    
    public func createActiveCard(_ id: Int16, text: String) {
        guard let activeEntityDescription = NSEntityDescription.entity(forEntityName: "ActiveCard", in: context) else { return }
        
        let active = ActiveCard(entity: activeEntityDescription, insertInto: context)
        active.id = id
        active.text = text
        
        appDelegate.saveContext()
    }
    
    public func fetchActiveCards() -> [ActiveCard]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ActiveCard")
        do {
            return try context.fetch(fetchRequest) as! [ActiveCard]
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    public func fetchActiveCard(with id: Int16) -> ActiveCard?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ActiveCard")
        do {
            guard let ActiveCards = try? context.fetch(fetchRequest) as? [ActiveCard] else {return nil}
            return ActiveCards.first(where: { $0.id == id })
        }
    }
    
    
    // moodCard
    
    
    public func createMood(_ id: Int16, text: String) {
        guard let MoodEntityDescription = NSEntityDescription.entity(forEntityName: "Mood", in: context) else { return }
        
        let Mood = Mood(entity: MoodEntityDescription, insertInto: context)
        Mood.id = id
        Mood.text = text
        
        appDelegate.saveContext()
    }
    
    public func fetchMoods() -> [Mood]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mood")
        do {
            return try context.fetch(fetchRequest) as! [Mood]
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    public func fetchMood(with id: Int16) -> Mood?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mood")
        do {
            guard let Moods = try? context.fetch(fetchRequest) as? [Mood] else {return nil}
            return Moods.first(where: { $0.id == id })
        }
    }
    
    // SituationCard
    
    public func createSituationCard(_ id: Int16, text: String) {
        guard let SituationCardEntityDescription = NSEntityDescription.entity(forEntityName: "SituationCard", in: context) else { return }
        
        let SituationCard = SituationCard(entity: SituationCardEntityDescription, insertInto: context)
        SituationCard.id = id
        SituationCard.text = text
        
        appDelegate.saveContext()
    }
    
    public func fetchSituationCards() -> [SituationCard]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SituationCard")
        do {
            return try context.fetch(fetchRequest) as! [SituationCard]
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    public func fetchSituationCard(with id: Int16) -> SituationCard?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SituationCard")
        do {
            guard let SituationCards = try? context.fetch(fetchRequest) as? [SituationCard] else {return nil}
            return SituationCards.first(where: { $0.id == id })
        }
    }
    
    // Lobby
    
    public func createLobby(aCardID1: Int16, aCardID2: Int16, aCardID3: Int16, aCardID4: Int16, aCardID5: Int16, moodID: Int16, playerID: Int16, roleID: Int16, roomID: Int16, situationID: Int16) {
        guard let LobbyEntityDescription = NSEntityDescription.entity(forEntityName: "Lobby", in: context) else { return }
        
        let lobby = Lobby(entity: LobbyEntityDescription, insertInto: context)
        lobby.roomID = roomID
        lobby.situationID = situationID
        lobby.moodID = moodID
        lobby.playerID = playerID
        lobby.roleID = roleID
        lobby.aCardID1 = aCardID1
        lobby.aCardID2 = aCardID2
        lobby.aCardID3 = aCardID3
        lobby.aCardID4 = aCardID4
        lobby.aCardID5 = aCardID5
        
        
        
        appDelegate.saveContext()
    }
    
    public func lobbyExists(aCardID1: Int16, aCardID2: Int16, aCardID3: Int16, aCardID4: Int16, aCardID5: Int16, moodID: Int16, playerID: Int16, roleID: Int16, roomID: Int16, situationID: Int16) -> Bool {
        // Создаем запрос на выборку
        let fetchRequest: NSFetchRequest<Lobby> = Lobby.fetchRequest()
        
        // Устанавливаем условия фильтрации
        fetchRequest.predicate = NSPredicate(format: "aCardID1 == %@ AND aCardID2 == %@ AND aCardID3 == %@ AND aCardID4 == %@ AND aCardID5 == %@ AND moodID == %@ AND playerID == %@ AND roleID == %@ AND roomID == %@ AND situationID == %@", argumentArray: [aCardID1, aCardID2, aCardID3, aCardID4, aCardID5, moodID, playerID, roleID, roomID, situationID])
        
        // Пытаемся выполнить запрос
        do {
            let result = try context.fetch(fetchRequest)
            // Если результат не пуст, то такая запись уже существует
            return !result.isEmpty
        } catch {
            print("Failed to fetch Lobby: \(error)")
            return false
        }
    }
    
    public func lobbyfinder(playerID: Int16, roomID: Int16) -> Lobby? {
        // Создаем запрос на выборку
        let fetchRequest: NSFetchRequest<Lobby> = Lobby.fetchRequest()
        
        // Устанавливаем условия фильтрации
        fetchRequest.predicate = NSPredicate(format: "playerID == %@ AND roomID == %@", argumentArray: [playerID, roomID])
        
        // Пытаемся выполнить запрос
        do {
            let result = try context.fetch(fetchRequest)
            // Если результат не пуст, возвращаем первую найденную запись
            if let lobby = result.first {
                return lobby
            } else {
                return nil
            }
        } catch {
            print("Failed to fetch Lobby: \(error)")
            return nil
        }
    }


    
    public func fetchLobbys() -> [Lobby]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Lobby")
        do {
            return try context.fetch(fetchRequest) as! [Lobby]
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    public func fetchLobby(with id: Int16) -> Lobby?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Lobby")
        do {
            guard let Lobbys = try? context.fetch(fetchRequest) as? [Lobby] else {return nil}
            return Lobbys.first(where: { $0.roomID == id })
        }
    }
}

