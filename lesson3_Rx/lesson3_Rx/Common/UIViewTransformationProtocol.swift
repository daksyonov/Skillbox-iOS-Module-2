//
//  UIViewTransformationProtocol.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 14.02.2022.
//

// MARK: - UIViewTransformationProtocol

import UIKit

protocol UIViewTransformationProtocol: Animatable {

	func setBackgroundColor(color: UIColor, _ completion: @escaping () -> Void)
	func shiftCenter(to point: CGPoint, _ completion: @escaping () -> Void)
	func scaleTransform(x: CGFloat, y: CGFloat, _ completion: (() -> Void)?)
}

extension UIViewTransformationProtocol {

	func setBackgroundColor(color: UIColor, _ completion: @escaping () -> Void) { }
	func shiftCenter(to point: CGPoint, _ completion: @escaping () -> Void) { }
	func scaleTransform(x: CGFloat, y: CGFloat, _ completion: (() -> Void)?) { }
}
