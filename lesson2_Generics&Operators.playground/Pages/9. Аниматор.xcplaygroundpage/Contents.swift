//: [Previous](@previous)

import PlaygroundSupport
import UIKit
import SwiftUI
import CoreGraphics

/*:
 # Создаем методы для анимированных трансформаций UIView
 
 Чтобы это все реализовать, потребуется контроллер-болванка, объявление протокола и
 реализация нужных методов
 
 ## ViewController
 Создадим некоторый ВК, у которого видно вью.
 */

// MARK: - Declare Sample VC

final class ViewController: UIViewController {
	
	private var lastCenter: CGPoint?
	private var circle: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .cyan
		setCircle()
		view.addSubview(circle)
	}
	
	private func setCircle() {
		let view = UIView(frame: CGRect(x: .zero, y: .zero, width: 200, height: 200))
		
		let halfSize:CGFloat = min(
			view.bounds.size.width / 2,
			view.bounds.size.height / 2
		)
		let desiredLineWidth:CGFloat = 1
		let circlePath = UIBezierPath(
			arcCenter: CGPoint(x: halfSize,y: halfSize),
			radius: CGFloat(halfSize - (desiredLineWidth / 2) ),
			startAngle: CGFloat(0),
			endAngle:CGFloat(Double.pi * 2),
			clockwise: true
		)
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = circlePath.cgPath
		shapeLayer.fillColor = UIColor.clear.cgColor
		shapeLayer.strokeColor = UIColor.red.cgColor
		shapeLayer.lineWidth = desiredLineWidth
		
		view.layer.addSublayer(shapeLayer)
		view.center = self.view.center
		circle = view
	}
	
	private func alertController(
		_ completion: @escaping (UIAlertAction) -> Void
	) {
		let alert = UIAlertController(
			title: "Success",
			message: nil,
			preferredStyle: .alert
		)
		alert.addAction(
			UIAlertAction(
				title: "Next",
				style: .default,
				handler: completion
			)
		)
		self.present(alert, animated: true)
	}
	
	func resetCenter(_ completion: @escaping () -> Void) {
		animate(animations: {
			guard let center = self.lastCenter
			else {
				return
			}
			
			self.view.center = center
			self.circle.center = center
			self.alertController { _ in
				completion()
			}
		})
	}
}

/*:
 ## Animatable Protocol
 Создадим протокол, отвечающий требованиям задания:
 1) изменяющий фоновый цвет для UIView;
 2) изменяющий center UIView;
 3) делающий scale-трансформацию для UIView.
 
 Пусть он наследуется от базового протокола, устанавливающего базовый метод анимации
 */

// MARK: - Animatable Protocol

/// Базовый интерфейс, предлаающий реализацию метода анимации
protocol Animatable: UIViewController {
	
	var backgroundColor: UIColor? { get set }
	
	func animate(
		duration: TimeInterval,
		delay: TimeInterval,
		damping: CGFloat,
		springVelocity: CGFloat,
		options: UIView.AnimationOptions,
		animations: @escaping () -> Void,
		completion: ((Bool) -> Void)?
	)
}

extension Animatable {
	
	func animate(
		duration: TimeInterval = 0.5,
		delay: TimeInterval = 1,
		damping: CGFloat = 1,
		springVelocity: CGFloat = 0.5,
		options: UIView.AnimationOptions = [],
		animations: @escaping () -> Void = { },
		completion: ((Bool) -> Void)? = nil
	) {
		UIView.animate(
			withDuration: duration,
			delay: delay,
			usingSpringWithDamping: damping,
			initialSpringVelocity: springVelocity,
			options: options,
			animations: animations,
			completion: completion
		)
	}
}

protocol UIViewTransformationProtocol: Animatable {
	
	func setBackgroundColor(color: UIColor, _ completion: @escaping () -> Void)
	func shiftCenter(to point: CGPoint, _ completion: @escaping () -> Void)
	func scaleTransform(x: CGFloat, y: CGFloat, _ completion: (() -> Void)?)
}


/*:
 ## Реализуем требования протокола на ВК
 */

extension ViewController: UIViewTransformationProtocol {
	
	var backgroundColor: UIColor? {
		get { view.backgroundColor }
		set { view.backgroundColor = newValue }
	}
	
	func setBackgroundColor(color: UIColor, _ completion: @escaping () -> Void) {
		animate(animations: {
			self.backgroundColor = color
		}, completion: { _ in
			self.alertController { _ in
				completion()
			}
		})
	}
	
	func shiftCenter(to point: CGPoint, _ completion: @escaping () -> Void) {
		animate(animations: {
			self.lastCenter = self.view.center
			self.view.center = point
			self.circle.center = self.view.center
		}, completion: { _ in
			self.alertController { _ in
				completion()
			}
		})
	}
	
	func scaleTransform(x: CGFloat, y: CGFloat, _ completion: (() -> Void)? = nil) {
		animate(animations: {
			let transform = CGAffineTransform.identity.scaledBy(x: 0.5, y: 0.5)
			self.view.transform = transform
		}, completion: { _ in
			guard let completion = completion else {
				return
			}
			
			self.alertController({ _ in
				completion()
			})
		})
	}
	
}

// MARK: - Prepare Playground Page

let viewController = ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = viewController
viewController.setBackgroundColor(color: .purple, {
	viewController.shiftCenter(to: .zero, {
		viewController.resetCenter {
			viewController.scaleTransform(x: 0.5, y: 0.5) {
				let alert = UIAlertController(
					title: "Success",
					message: nil,
					preferredStyle: .alert
				)
				alert.addAction(UIAlertAction(title: "Next",style: .default))
				viewController.present(alert,animated: true)
			}
		}
		
	})
})

//: [Next](@next)
