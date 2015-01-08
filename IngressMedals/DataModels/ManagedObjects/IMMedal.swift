
internal enum IMMedalType: Int {
	
//	case ProgressNotDetermined	// TODO:
	case NotStarted
	case Copper
	case Silver
	case Gold
	case Platinum
	case Onyx

	internal static func notStartedProgress() -> Double {
		return 0.0
	}
	
	internal static func count() -> Int {
		return 6
	}
	
	internal func borderColor() -> UIColor {
		switch self {
		case .NotStarted, .Copper:
			return UIColor(decimalRed: 208, green: 143, blue: 111, alpha: 1.0)
		case .Silver:
			return UIColor(decimalRed: 153, green: 176, blue: 182, alpha: 1.0)
		case .Gold:
			return UIColor(decimalRed: 251, green: 212, blue: 137, alpha: 1.0)
		case .Platinum:
			return UIColor.whiteColor()
		case .Onyx:
			return UIColor.blackColor()
		}
	}
	
	internal func backgroundColor() -> UIColor {
		switch self {
		case .NotStarted, .Copper:
			return UIColor(decimalRed: 74, green: 32, blue: 12, alpha: 1.0)
		case .Silver:
			return UIColor(decimalRed: 58, green: 66, blue: 67, alpha: 1.0)
		case .Gold:
			return UIColor(decimalRed: 107, green: 77, blue: 39, alpha: 1.0)
		case .Platinum:
			return UIColor.whiteColor()
		case .Onyx:
			return UIColor.blackColor()
		}
	}
}

@objc(IMMedal)
class IMMedal: _IMMedal {

	internal var medalType: IMMedalType {
		get {
			return IMMedalType(rawValue: Int(self.type!))!
		}
	}
}
