//
//  SituationCard+CoreDataProperties.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 27.4.2024.
//
//

import Foundation
import CoreData


extension SituationCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SituationCard> {
        return NSFetchRequest<SituationCard>(entityName: "SituationCard")
    }

    @NSManaged public var id: Int16
    @NSManaged public var text: String?

}

extension SituationCard : Identifiable {

}
