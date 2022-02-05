//: [Previous](@previous)

import UIKit

// MARK: - Протокол: компьютерная игра

class DrawableFlyingObject {

	// MARK: Properties

	var someProperty: Any

	// MARK: Initialization

	init(anything: Any) {
		someProperty = anything
	}

}

// MARK: - <Drawable> Conformance

extension DrawableFlyingObject: Drawable {

	func drawLine(from: CGPoint, to: CGPoint) {
		/**
		 здесь некоторая реализация
		 */
	}

	func drawCurve(from: CGPoint, through curvePoint: CGPoint, with curveAngle: UnitAngle, to: CGPoint) {
		/**
		 здесь некоторая реализация
		 */
	}

	func drawArc(from: CGPoint, to: CGPoint, with curveAngle: UnitAngle) {
		/**
		 здесь некоторая реализация
		 */
	}

}

// MARK: - <Flyable> Conformance

extension DrawableFlyingObject: Flyable {

	func takeOff() -> Bool {
		/**
		 здесь некоторая реализация
		 */

		true
	}

	func fly() -> FlyingContext {
		/**
		 здесь некоторая реализация
		 */

		return FlyingContext(
			temp: UnitTemperature(symbol: "C"),
			windSpeed: WindSpeed.init(),
			direction: .north,
			timeInFlight: Date().timeIntervalSince1970,
			eta: Date().timeIntervalSince1970 - Double(Int.random(in: 0...1)),
			naturalSpeed: 14,
			lightLevel: 2
		)
	}

	func land() {
		/**
		 здесь некоторая реализация
		 */
	}

	func landed() -> Bool {
		/**
		 здесь некоторая реализация
		 */

		true
	}


}
//: [Next](@next)

