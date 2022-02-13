//
//  CounterViewController.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 13.02.2022.
//

import UIKit

final class CounterViewController: UIViewController {

	@IBOutlet private weak var counterLabel: UILabel!
	@IBOutlet private weak var countButton: UIButton!
	@IBOutlet private weak var resetButton: UIButton!

	private var count: Int = 0

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction private func count(_ sender: Any) {
		count += 1
		counterLabel.text = "\(count)"
	}

	@IBAction private func reset(_ sender: Any) {
		count = 0
		counterLabel.text?.removeAll()
	}
}
