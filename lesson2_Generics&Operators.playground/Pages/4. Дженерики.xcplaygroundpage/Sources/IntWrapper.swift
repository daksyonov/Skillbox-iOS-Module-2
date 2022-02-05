
// MARK: - Int Wrapper

/// Wraps the int.
/// Dummy for Generic Constraint case
public struct IntWrapper {

	var value: Int

}

// MARK: -  <Numeric> implementation

extension IntWrapper: GenericConstraint {

	// MARK: Subtypes

	public typealias Magnitude = Int
	public typealias IntegerLiteralType = Int

	// MARK: Properties

	public var magnitude: Int {
		Int(value)
	}

	// MARK: Initialization

	public init(integerLiteral value: Int) {
		self.value = value
	}

	public init?<T>(exactly source: T) where T : BinaryInteger {
		self.value = 0
	}

	// MARK: Methods

	public static func + (lhs: IntWrapper, rhs: IntWrapper) -> IntWrapper {
		return IntWrapper(value: lhs.value + rhs.value)
	}

	public static func - (lhs: IntWrapper, rhs: IntWrapper) -> IntWrapper {
		return IntWrapper(value: lhs.value - rhs.value)
	}

	public static func * (lhs: IntWrapper, rhs: IntWrapper) -> IntWrapper {
		return IntWrapper(value: lhs.value * rhs.value)
	}

	public static func *= (lhs: inout IntWrapper, rhs: IntWrapper) {
		lhs.value *= rhs.value
	}

}
