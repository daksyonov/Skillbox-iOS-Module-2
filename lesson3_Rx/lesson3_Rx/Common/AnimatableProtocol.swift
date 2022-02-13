//
//  AnimatableProtocol.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 14.02.2022.
//

import UIKit
import CoreGraphics


// MARK: - Animatable Protocol

protocol Animatable: UIViewController {

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
		options: UIView.AnimationOptions = [.curveEaseIn, .autoreverse],
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
