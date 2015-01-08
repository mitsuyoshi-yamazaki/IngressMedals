@objc(IMData)
class IMData: _IMData {
	
	internal class func createData() -> IMData {
		
		let data = self.MR_createEntity() as IMData
		
		data.identifier = "\(self.className).\(self.MR_countOfEntities())"
		
		let now = NSDate()
		
		data.createdAt = now
		data.updatedAt = now
		
		return data
	}
	
	internal func deleteData() {
		self.deletedAt = NSDate()
		NSManagedObjectContext.MR_contextForCurrentThread().MR_saveToPersistentStoreAndWait()
	}
	
	class func MR_entityName() -> String {
		return self.className
	}
}
