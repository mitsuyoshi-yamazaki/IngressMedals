@objc(IMObjective)
class IMObjective: _IMObjective {

	internal var progressValue: Double {
		set {
			self.progress = NSNumber(double: newValue)
		}
		get {
			return self.progress!.doubleValue
		}
	}
	
	internal var medalType: IMMedalType {
		get {
			var medalType = IMMedalType.NotStarted
			
			for medal in self.medals.array as [IMMedal] {
				if self.progress!.doubleValue >= medal.progress!.doubleValue {
					medalType = medal.medalType
				}
			}
			return medalType
		}
	}
	
	override class func createData() -> IMObjective {
		
		let objective = superclass()!.createData() as IMObjective
		
		objective.progress = 0.0
		
		return objective
	}
}
