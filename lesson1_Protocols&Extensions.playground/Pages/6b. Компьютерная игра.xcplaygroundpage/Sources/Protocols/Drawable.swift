import UIKit

// MARK: - Drawable Protocol

/// Опсиывает набор требований для объекта, который может летать
public protocol Drawable {

	/// Метод, позволяющий нарисовать линию
	/// - Parameters:
	///  - from: Точка начала отрисовки
	///  - to: Точка окончания отрисовки
	func drawLine(from: CGPoint, to: CGPoint)

	/// Метод, позволяющий нарисовать кривую
	/// - Parameters:
	///  - from: Точка начала отрисовки
	///  - through: Точка искривления
	///  - curveAngle: Уровень "искривления"
	///  - to: Точка окончания отрисовки
	func drawCurve(
		from: CGPoint,
		through curvePoint: CGPoint,
		with curveAngle: UnitAngle,
		to: CGPoint
	)
	
	/// Метод, позволяющий нарисовать линию
	/// - Parameters:
	///  - from: Точка начала отрисовки
	///  - to: Точка окончания отрисовки
	///  - curveAngle: Уровень "искривления"
	func drawArc(
		from: CGPoint,
		to: CGPoint,
		with curveAngle: UnitAngle
	)

}
