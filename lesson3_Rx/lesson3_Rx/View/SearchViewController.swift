//
//  SearchViewController.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 13.02.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: UIViewController {

	@IBOutlet private weak var searchTextField: UITextField!
	@IBOutlet private weak var outputTextView: UITextView!
	@IBOutlet private weak var resetButton: UIButton!

	private var disposeBag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		observeSearchField()

		searchTextField.textColor = .black
		searchTextField.placeholder = "Enter something here..."
	}

	@IBAction private func reset(_ sender: Any) {
		searchTextField.text?.removeAll()
		outputTextView.text.removeAll()
	}

	private func observeSearchField() {
		searchTextField
			.rx
			.controlEvent(.editingChanged)
			.asObservable()
			.throttle(.milliseconds(700), scheduler: MainScheduler.asyncInstance)
			.subscribe(onNext: {
				self.outputTextView.text = "Search for: \(self.searchTextField.text ?? "")"
			})
			.disposed(by: self.disposeBag)
	}

	private func setResetButton() {
		resetButton
			.rx
			.tap
			.subscribe(onNext: {
				self.searchTextField.text?.removeAll()
			})
			.disposed(by: self.disposeBag)
	}
}
