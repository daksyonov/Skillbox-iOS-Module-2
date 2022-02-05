//: [Previous](@previous)

import UIKit

// MARK: - <CGRect> Extension

extension CGRect {

	/// Центр прямоугольника
	/// Здесь важная оговорка: я бы хотел это реализовать, как вычисляемое свойство и вот почему:
	/// - свойство описывает внутреннее качество объекта
	/// - метод же, какое-то действие
	/// - мы здесь больше о свойстве
	/// - параметры нам не нужны
	/// - таким образом предлагаю сделать это вычисляемой переменной
	/// https://www.swiftbysundell.com/tips/computed-properties-vs-methods/
	/// https://medium.com/swift-india/functions-vs-computed-property-what-to-use-64bbe2df3916
	var centerPoint: CGPoint {
		CGPoint(x: midX, y: midY)
	}

	/// Площадь прямоугольника
	/// Здесь те же аргументы, почему это `var` а не `func`
	var area: Double {
		width * height
	}

}

// MARK: - <UIView> Extension

extension UIView {

	func hideAnimated(
		duration: TimeInterval = 0.5,
		delay: TimeInterval = 0.0,
		damping: CGFloat = 1,
		velocity: CGFloat = 1,
		animationOptions: AnimationOptions = AnimationOptions(),
		completion: ((Bool) -> Void)? = nil
	) {
		UIView.animate(
			withDuration: duration,
			delay: delay,
			usingSpringWithDamping: damping,
			initialSpringVelocity: velocity,
			options: animationOptions,
			animations: {
				self.alpha = 0
			},
			completion: completion
		)
	}

}

// MARK: - <Comparable> Extension

extension Comparable where Self: AdditiveArithmetic {

	func bound(min: Self, max: Self) -> Self {
		max - min
	}

}

// MARK: - <Array> 'where-Int' Extension

extension Array where Element == Int {

	var sum: Int {
		!self.isEmpty ? self.reduce(0, +) : 0
	}

}

//: [Next](@next)
