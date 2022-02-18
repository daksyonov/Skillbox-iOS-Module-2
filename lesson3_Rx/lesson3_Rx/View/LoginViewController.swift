//
//  ViewController.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 13.02.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {

	private var mockLogin: String = ""
	private var mockPassword: String = ""

	private var disposeBag = DisposeBag()

	@IBOutlet private weak var loginTextField: UITextField!
	@IBOutlet private weak var passwordTextField: UITextField!
	@IBOutlet private weak var loginButton: UIButton!
	@IBOutlet private weak var resetButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		setObservables()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		showCredentialsSetter()
	}


	private func login() {
		guard !mockLogin.isEmpty,
			  !mockPassword.isEmpty
		else {
			showErrorAlert(
				title: "Credentials not set",
				message: "Please set credentials"
			)
			return
		}

		guard let login = loginTextField.text,
			  let pwd = passwordTextField.text
		else {
			showErrorAlert(
				title: "Login data not found",
				message: "Make sure all text fields are filled"
			)
			return
		}

		let loginStatus = login == mockLogin
		let pwdStatus = pwd == mockPassword

		if !loginStatus {
			showErrorAlert(
				title: "Login did not match",
				message: "Try again"
			)
		}
		if !pwdStatus {
			showErrorAlert(
				title: "Password did not match",
				message: "Try again"
			)
		}
	}

	private func reset() {
		mockLogin.removeAll()
		mockPassword.removeAll()
		loginTextField.text?.removeAll()
		passwordTextField.text?.removeAll()
	}

	private func showErrorAlert(title: String, message: String) {
		let alert = UIAlertController(
			title: title,
			message: message,
			preferredStyle: .alert
		)
		let resetAction = UIAlertAction(
			title: "Reset",
			style: .destructive,
			handler: { _ in self.reset() }
		)
		let retryAction = UIAlertAction(
			title: "Retry",
			style: .default
		)

		[resetAction, retryAction].forEach {
			alert.addAction($0)
		}

		present(alert, animated: true)
	}

	private func showCredentialsSetter() {
		let alert = UIAlertController(
			title: "Select credentials",
			message: "This will mock the account",
			preferredStyle: .alert
		)
		alert.addTextField()
		alert.addTextField()
		alert.textFields?.first?.placeholder = "Login"
		alert.textFields?.last?.placeholder = "Password"

		let doneAction = UIAlertAction(
			title: "Done",
			style: .default,
			handler: { _ in
				guard let login = alert.textFields?.first?.text,
					  let pwd = alert.textFields?.last?.text
				else {
					self.showCredentialsSetter()
					return
				}

				self.mockLogin = login
				self.mockPassword = pwd
			}
		)
		let cancelAction = UIAlertAction(
			title: "Cancel",
			style: .cancel
		)

		[doneAction, cancelAction].forEach {
			alert.addAction($0)
		}

		present(alert, animated: true)
	}
}

// MARK: - Rx

extension LoginViewController {

	private func setObservables() {
		loginButton
			.rx
			.tap
			.observe(on: MainScheduler.instance)
			.subscribe(
				onNext: { self.login() }
			)
			.disposed(by: self.disposeBag)

		resetButton
			.rx
			.tap
			.observe(on: MainScheduler.instance)
			.subscribe(
				onNext: { self.reset() }
			)
			.disposed(by: self.disposeBag)

		loginTextField
			.rx
			.text
			.observe(on: MainScheduler.instance)
			.subscribe(<#T##on: (Event<String?>) -> Void##(Event<String?>) -> Void#>)
			.disposed(by: self.disposeBag)re
	}
}
