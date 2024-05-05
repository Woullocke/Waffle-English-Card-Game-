import Foundation
import CoreData


extension ActiveCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActiveCard> {
        return NSFetchRequest<ActiveCard>(entityName: "ActiveCard")
    }

    @NSManaged public var id: Int16
    @NSManaged public var text: String?
    // TODO: сейчас дублируется id и text из SituationCard, Role и Mood. Нужно сделать базовый класс BaseCard с id и text и от него сделать 4 класса: SituationCard и ActiveCard, RoleCard, MoodCard

}

extension ActiveCard : Identifiable {

}
