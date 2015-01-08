// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IMObjective.swift instead.

import CoreData

enum IMObjectiveAttributes: String {
    case detail = "detail"
    case progress = "progress"
    case title = "title"
}

enum IMObjectiveRelationships: String {
    case events = "events"
    case medals = "medals"
}

@objc
class _IMObjective: IMData {

    // MARK: - Class methods

    override class func entityName () -> String {
        return "IMObjective"
    }

    override class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _IMObjective.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var detail: String?

    // func validateDetail(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var progress: NSNumber?

    // func validateProgress(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var title: String?

    // func validateTitle(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var events: NSSet

    @NSManaged
    var medals: NSOrderedSet

}

extension _IMObjective {

    func addEvents(objects: NSSet) {
        let mutable = self.events.mutableCopy() as NSMutableSet
        mutable.unionSet(objects)
        self.events = mutable.copy() as NSSet
    }

    func removeEvents(objects: NSSet) {
        let mutable = self.events.mutableCopy() as NSMutableSet
        mutable.minusSet(objects)
        self.events = mutable.copy() as NSSet
    }

    func addEventsObject(value: IMEvent!) {
        let mutable = self.events.mutableCopy() as NSMutableSet
        mutable.addObject(value)
        self.events = mutable.copy() as NSSet
    }

    func removeEventsObject(value: IMEvent!) {
        let mutable = self.events.mutableCopy() as NSMutableSet
        mutable.removeObject(value)
        self.events = mutable.copy() as NSSet
    }

}

extension _IMObjective {

    func addMedals(objects: NSOrderedSet) {
        let mutable = self.medals.mutableCopy() as NSMutableOrderedSet
        mutable.unionOrderedSet(objects)
        self.medals = mutable.copy() as NSOrderedSet
    }

    func removeMedals(objects: NSOrderedSet) {
        let mutable = self.medals.mutableCopy() as NSMutableOrderedSet
        mutable.minusOrderedSet(objects)
        self.medals = mutable.copy() as NSOrderedSet
    }

    func addMedalsObject(value: IMMedal!) {
        let mutable = self.medals.mutableCopy() as NSMutableOrderedSet
        mutable.addObject(value)
        self.medals = mutable.copy() as NSOrderedSet
    }

    func removeMedalsObject(value: IMMedal!) {
        let mutable = self.medals.mutableCopy() as NSMutableOrderedSet
        mutable.removeObject(value)
        self.medals = mutable.copy() as NSOrderedSet
    }

}
