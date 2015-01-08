// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IMMedal.swift instead.

import CoreData

enum IMMedalAttributes: String {
    case achievedDate = "achievedDate"
    case detail = "detail"
    case progress = "progress"
    case title = "title"
    case type = "type"
}

enum IMMedalRelationships: String {
    case objective = "objective"
}

@objc
class _IMMedal: IMData {

    // MARK: - Class methods

    override class func entityName () -> String {
        return "IMMedal"
    }

    override class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _IMMedal.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var achievedDate: NSDate?

    // func validateAchievedDate(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var detail: String?

    // func validateDetail(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var progress: NSNumber?

    // func validateProgress(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var title: String?

    // func validateTitle(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var type: NSNumber?

    // func validateType(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var objective: IMObjective

    // func validateObjective(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

