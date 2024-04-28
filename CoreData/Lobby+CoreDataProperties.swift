//
//  Lobby+CoreDataProperties.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 28.4.2024.
//
//

import Foundation
import CoreData


extension Lobby {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lobby> {
        return NSFetchRequest<Lobby>(entityName: "Lobby")
    }

    @NSManaged public var roomID: Int16
    @NSManaged public var playerID: Int16
    @NSManaged public var situationID: Int16
    @NSManaged public var aCardID1: Int16
    @NSManaged public var aCardID2: Int16
    @NSManaged public var aCardID3: Int16
    @NSManaged public var aCardID4: Int16
    @NSManaged public var aCardID5: Int16
    @NSManaged public var roleID: Int16
    @NSManaged public var moodID: Int16

}

extension Lobby : Identifiable {

}
