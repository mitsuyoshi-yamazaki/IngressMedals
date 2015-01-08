@objc(IMEvent)
class IMEvent: _IMEvent {

	internal var medalType: IMMedalType {
		get {
			var medalType = IMMedalType.NotStarted
			
			for medal in self.objective.medals.array as [IMMedal] {
				if self.progress!.doubleValue >= medal.progress!.doubleValue {
					medalType = medal.medalType
				}
			}
			return medalType
		}
	}
}
