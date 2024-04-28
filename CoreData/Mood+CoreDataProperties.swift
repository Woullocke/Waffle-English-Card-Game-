//
//  Mood+CoreDataProperties.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 27.4.2024.
//
//

import Foundation
import CoreData


extension Mood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mood> {
        return NSFetchRequest<Mood>(entityName: "Mood")
    }

    @NSManaged public var id: Int16
    @NSManaged public var text: String?

}

extension Mood : Identifiable {

}
