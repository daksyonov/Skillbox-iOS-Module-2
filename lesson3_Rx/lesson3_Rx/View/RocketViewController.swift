//
//  RocketViewController.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 13.02.2022.
//

import UIKit

final class RocketViewController: UIViewController {

	@IBOutlet private weak var rocketImageView: UIImageView!
	@IBOutlet private weak var rocketImageTopConstraint: NSLayoutConstraint!
	@IBOutlet private weak var statusLabel: UILabel!
	@IBOutlet private weak var launchButton: UIButton!
	@IBOutlet private weak var anotherLaunchButton: UIButton!
	@IBOutlet private weak var resetButton: UIButton!

	private var lastCenter: CGPoint = .zero

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		lastCenter = rocketImageView.center
	}

	@IBAction private func launch(_ sender: UIButton) {
		shiftCenter(to: CGPoint(x: 500, y: 50), { })
	}

	@IBAction private func reset(_ sender: UIButton) {
		animate(
			duration: 1,
			curve: .easeInOut
		) {
			self.rocketImageView.center = self.lastCenter
		}
	}

}

extension RocketViewController: UIViewTransformationProtocol {

	func shiftCenter(to point: CGPoint, _ completion: @escaping () -> Void) {
		animate(
			duration: 1,
			curve: .easeInOut
		) {
			self.rocketImageView.center = point
		}
	}

	func animate(
		duration: TimeInterval,
		curve: UIView.AnimationCurve,
		animations: @escaping () -> Void
	) {
		let animator = UIViewPropertyAnimator(
			duration: 1,
			curve: curve
		) {
			animations()
		}

		animator.startAnimation()
	}

}
