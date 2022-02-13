//
//  SearchViewController.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 13.02.2022.
//

import UIKit
import RxSwift
import SwiftyBeaver

final class SearchViewController: UIViewController {

	@IBOutlet private weak var searchTextField: UITextField!
	@IBOutlet private weak var outputTextView: UITextView!
	@IBOutlet private weak var resetButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		searchTextField.delegate = self
	}

	@IBAction private func reset(_ sender: Any) {
		searchTextField.text?.removeAll()
		outputTextView.text.removeAll()
	}

	private func performSearch(with delay: Double = 0.5) {

		updateTextView()
	}

	private func updateTextView() {

	}
}

extension SearchViewController: UITextFieldDelegate {

	func textFieldDidEndEditing(_ textField: UITextField) {
		performSearch()
	}

}
