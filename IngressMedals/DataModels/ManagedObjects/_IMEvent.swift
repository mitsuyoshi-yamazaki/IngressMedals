// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IMEvent.swift instead.

import CoreData

enum IMEventAttributes: String {
    case detail = "detail"
    case progress = "progress"
}

enum IMEventRelationships: String {
    case objective = "objective"
}

@objc
class _IMEvent: IMData {

    // MARK: - Class methods

    override class func entityName () -> String {
        return "IMEvent"
    }

    override class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _IMEvent.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var detail: String?

    // func validateDetail(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var progress: NSNumber?

    // func validateProgress(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var objective: IMObjective

    // func validateObjective(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

