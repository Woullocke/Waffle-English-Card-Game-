import Foundation
import CoreData


extension Role {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Role> {
        return NSFetchRequest<Role>(entityName: "Role")
    }

    @NSManaged public var id: Int16
    @NSManaged public var text: String?

}

extension Role : Identifiable {

}
