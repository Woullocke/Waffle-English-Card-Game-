//
//  ArrayProcessing.swift
//  Waffle! (Project in progress)
//
//  Created by Иван Булгаков on 27.4.2024.
//

import Foundation
import CoreData

func processArrays(){
    let rolesArray: [(id: Int16, text: String)] = [
        (1, "Teacher"),
        (2, "Writer/Poet"),
        (3, "Mayor"),
        (4, "Tramp"),
        (5, "Elderly person"),
        (6, "A police officer"),
        (7, "Postman or postwoman"),
        (8, "Famous singer"),
        (9, "Retired sportsman/sportswoman"),
        (10, "Baker"),
        (11, "Man out of work"),
        (12, "A busy housewife"),
        (13, "Businessman/businesswoman"),
        (14, "A diligent child"),
        (15, "A German delegate"),
        (16, "A novelist"),
        (17, "A correspondent"),
        (18, "A miserable boy of 9 years"),
        (19, "A doctor"),
        (20, "A surgeon"),
        (21, "A medical student"),
        (22, "A chemist"),
        (23, "A dentist"),
        (24, "A great pianist"),
        (25, "A bourgeois"),
        (26, "A maid"),
        (27, "An actress/actor"),
        (28, "A fisherman"),
        (29, "A plumber")
    ]
    
    
    
    for roleTuple in rolesArray {
        // Проверяем, существует ли уже запись с таким id
        let fetchRequest: NSFetchRequest<Role> = Role.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", roleTuple.id)
        
        do {
            let existingRoles = try StorageManager.shared.context.fetch(fetchRequest)
            if existingRoles.first != nil {
                // Роль с таким id уже существует, ничего не делаем
                print("Роль с id \(roleTuple.id) уже существует")
            } else {
                // Роль с таким id еще не существует, создаем новую запись
                StorageManager.shared.createRole(roleTuple.id, text: roleTuple.text)
            }
        } catch {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
        }
    }
    
    let ActiveCardArray: [(id: Int16, text: String)] = [
        (1, "Look! Who's talking!"),
        (2, "To strive"),
        (3, "To look young for one's age"),
        (4, "Divorced"),
        (5, "Middle-aged"),
        (6, "To pay attention"),
        (7, "You can't be serious!"),
        (8, "Fit the image"),
        (9, "Over fifty"),
        (10, "In society"),
        (11, "To let the whole world adapt to you"),
        (12, "To put something to doubt"),
        (13, "Hen-party"),
        (14, "Indecent"),
        (15, "Never fail to lend a helping hand"),
        (16, "Infidelity"),
        (17, "Cheerless look"),
        (18, "To marry again"),
        (19, "A sense of belonging"),
        (20, "A sense of tradition"),
        (21, "To keep in touch"),
        (22, "To stay single throughout one's life"),
        (23, "Upbringing"),
        (24, "Emotional support and security"),
        (25, "To be scattered"),
        (26, "Education"),
        (27, "To approve"),
        (28, "Inevitably"),
        (29, "Immoral"),
        (30, "It's no laughing matter!"),
        (31, "Ancient times"),
        (32, "A chain of unfortunate events"),
        (33, "You're nothing but a big baby!"),
        (34, "To scare away"),
        (35, "Hairdresser's parlour"),
        (36, "To lead one's life"),
        (37, "To come to a conclusion"),
        (38, "To abandon"),
        (39, "To be doomed"),
        (40, "All-absorbing pessimism"),
        (41, "Goodness gracious!"),
        (42, "Under no circumstances"),
        (43, "To drive one into a loser's mood"),
        (44, "To disapprove"),
        (45, "To come up with a piece of most valuable advice"),
        (46, "To turn to crime"),
        (47, "To treat as equals"),
        (48, "To be lucky"),
        (49, "To look full of promise"),
        (50, "To leave much"),
        (51, "A work of art"),
        (52, "To look for a job"),
        (53, "Full of activity"),
        (54, "All the time"),
        (55, "There is a time for everything"),
        (56, "Pointless existence"),
        (57, "Human warmth"),
        (58, "Reject society and its values"),
        (59, "To refuse"),
        (60, "To admire"),
        (61, "The gravity of the situation"),
        (62, "Love affair"),
        (63, "To celebrate"),
        (64, "Injury"),
        (65, "It's getting on my nerves!"),
        (66, "To come across"),
        (67, "To betray someone"),
        (68, "To give up doing something"),
        (69, "Fabulous"),
        (70, "Groceries"),
        (71, "A busy schedule"),
        (72, "To be known for something"),
        (73, "I'm fed up!"),
        (74, "Hurtful"),
        (75, "To cheer someone up"),
        (76, "To encourage"),
        (77, "A vacation"),
        (78, "Accompany"),
        (79, "It's to my liking"),
        (80, "Nothing could compare"),
        (81, "To enjoy oneself"),
        (82, "Wicked"),
        (83, "All for nothing"),
        (84, "To have a heart attack"),
        (85, "To pretend"),
        (86, "To come up with excuses"),
        (87, "To neglect one’s needs"),
        (88, "To face difficulties"),
        (89, "To lose one’s mind"),
        (90, "Perhaps"),
        (91, "A great deal of"),
        (92, "Don’t you agree?"),
        (93, "I have no idea!"),
        (94, "On the contrary!"),
        (95, "I couldn’t agree more"),
        (96, "To be dead certain"),
        (97, "To be desired hard work"),
        (98, "To something to make fun of someone"),
        (99, "Goodness knows!"),
        (100, "Unbearable"),
        (101, "Compassion and understanding"),
        (102, "Keep up with the times"),
        (103, "Unhappy existence")
    ]
    
    for ActiveCardTuple in ActiveCardArray {
        // Проверяем, существует ли уже запись с таким id
        let fetchRequest: NSFetchRequest<ActiveCard> = ActiveCard.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", ActiveCardTuple.id)
        
        do {
            let existingRoles = try StorageManager.shared.context.fetch(fetchRequest)
            if existingRoles.first != nil {
                // Роль с таким id уже существует, ничего не делаем
                print("Роль с id \(ActiveCardTuple.id) уже существует")
            } else {
                // Роль с таким id еще не существует, создаем новую запись
                StorageManager.shared.createActiveCard(ActiveCardTuple.id, text: ActiveCardTuple.text)
            }
        } catch {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
        }
    }
    
    let MoodArray: [(id: Int16, text: String)] = [
        (1, "Grumpy"),
        (2, "Dreamy"),
        (3, "Embarrassed"),
        (4, "Optimistic"),
        (5, "Whiny"),
        (6, "Arrogant"),
        (7, "Flirty"),
        (8, "Mischievous"),
        (9, "Thoughtful"),
        (10, "Jealous"),
        (11, "Annoyed"),
        (12, "Confused"),
        (13, "Confident"),
        (14, "In a hurry"),
        (15, "Excited"),
        (16, "Sentimental"),
        (17, "Upset"),
        (18, "Clumsy")
    ]
    
    for MoodTuple in MoodArray {
        // Проверяем, существует ли уже запись с таким id
        let fetchRequest: NSFetchRequest<Mood> = Mood.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", MoodTuple.id)
        
        do {
            let existingRoles = try StorageManager.shared.context.fetch(fetchRequest)
            if existingRoles.first != nil {
                // Роль с таким id уже существует, ничего не делаем
                print("Роль с id \(MoodTuple.id) уже существует")
            } else {
                // Роль с таким id еще не существует, создаем новую запись
                StorageManager.shared.createMood(MoodTuple.id, text: MoodTuple.text)
            }
        } catch {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
        }
    }
    
    let SituationCardArray: [(id: Int16, text: String)] = [
        (1, "Picking up a new hobby and not good at it"),
        (2, "Accidentally dressed up in the same clothes at a costume party"),
        (3, "Disagreement on how to arrange a party (time, place, food, etc.)"),
        (4, "Showing the flat to potential tenant/s as a landlord or landlady"),
        (5, "Mixing up a stranger with an old friend who owes money"),
        (6, "Tourist/group of tourists lost in an unfamiliar city meeting an asocial local"),
        (7, "Asking for advice on getting married OR divorced"),
        (8, "Exchanging news and gossip after not seeing each other in ages"),
        (9, "Wishing to buy the last remaining muffin in their favorite bakery"),
        (10, "Disagreement about which movie to watch"),
        (11, "Accusing someone of cheating in UNO after they won"),
        (12, "Quarreling over who gets the last sip of juice"),
        (13, "Unable to agree on a destination for a vacation"),
        (14, "Trying to cheer up OR bring down someone with a bad haircut"),
        (15, "Deciding between healthy or junk food for a sleepover at the grocery's"),
        (16, "Helping someone figure out a way to confess their feelings when in love")
    ]
    
    
    for SituationCardTuple in SituationCardArray {
        // Проверяем, существует ли уже запись с таким id
        let fetchRequest: NSFetchRequest<SituationCard> = SituationCard.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", SituationCardTuple.id)
        
        do {
            let existingRoles = try StorageManager.shared.context.fetch(fetchRequest)
            if existingRoles.first != nil {
                // Роль с таким id уже существует, ничего не делаем
                print("Роль с id \(SituationCardTuple.id) уже существует")
            } else {
                // Роль с таким id еще не существует, создаем новую запись
                StorageManager.shared.createSituationCard(SituationCardTuple.id, text: SituationCardTuple.text)
            }
        } catch {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
        }
    }
}
