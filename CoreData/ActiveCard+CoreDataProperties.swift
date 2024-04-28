import Foundation
import CoreData


extension ActiveCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActiveCard> {
        return NSFetchRequest<ActiveCard>(entityName: "ActiveCard")
    }

    @NSManaged public var id: Int16
    @NSManaged public var text: String?

}

extension ActiveCard : Identifiable {

}
