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

	private typealias CredCount = (loginOk: Bool, pwdOk: Bool)

	private var mockLogin: String = ""
	private var mockPassword: String = ""

	private var enteredLogin: String?
	private var enteredPwd: String?

	private var credStatus = BehaviorRelay<CredCount>(value: (false, false))
	private var disposeBag = DisposeBag()

	@IBOutlet private weak var loginTextField: UITextField!
	@IBOutlet private weak var passwordTextField: UITextField!
	@IBOutlet private weak var loginButton: UIButton!
	@IBOutlet private weak var resetButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		setObservables()
		setupUI()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		showCredentialsSetter()
	}

	// MARK: Business Logic

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

		guard !(loginTextField.text?.isEmpty ?? true),
			  !(passwordTextField.text?.isEmpty ?? true)
		else {
			showErrorAlert(title: "Nothing was entered", message: "")
			return
		}

		let loginStatus = enteredLogin == mockLogin
		let pwdStatus = enteredPwd == mockPassword

		if (enteredPwd?.count ?? 0) < 6 {
			showErrorAlert(
				title: "Pwd is less than 6 symbols",
				message: "Please reset via RESET button"
			)
		}

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

		if loginStatus && pwdStatus {
			showErrorAlert(title: "SUCCESS", message: "")
		}
	}

	private func reset() {
		mockLogin.removeAll()
		mockPassword.removeAll()
		loginTextField.text?.removeAll()
		passwordTextField.text?.removeAll()
		showCredentialsSetter()
	}

	// MARK: Utility

	private func matchSixCount(_ input: String?) -> Bool {
		guard let string = input
		else {
			return false
		}
		return string.count >= 6
	}

	// MARK: Alerts

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

		alert.addAction(doneAction)

		present(alert, animated: true)
	}

	// MARK: Login Button

	private func toggleLoginButton(on: Bool) {
		UIView.animate(withDuration: 0.3) {
			switch on {
			case true:
				self.loginButton.alpha = 1
				self.loginButton.isUserInteractionEnabled = true
			case false:
				self.loginButton.alpha = 0.5
				self.loginButton.isUserInteractionEnabled = false
			}
		}
	}
}

// MARK: - Rx

extension LoginViewController {

	private func setObservables() {

		// Buttons

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

		// TextFields

		loginTextField
			.rx
			.text
			.bind {
				self.enteredLogin = $0
				var value = self.credStatus.value
				value.loginOk = self.matchSixCount($0)
				self.credStatus.accept(value)
			}
			.disposed(by: self.disposeBag)

		passwordTextField
			.rx
			.text
			.bind {
				self.enteredPwd = $0
				var value = self.credStatus.value
				value.pwdOk = self.matchSixCount($0)
				self.credStatus.accept(value)
			}
			.disposed(by: self.disposeBag)

		// Creds 6 count status

		credStatus.subscribe { event in
			let status = event.element

			guard let status = status,
				  status.loginOk && status.pwdOk
			else {
				self.toggleLoginButton(on: false)
				return
			}
			self.toggleLoginButton(on: true)
		}
		.disposed(by: self.disposeBag)
	}

	func setupUI() {
		loginTextField.textColor = .black
		passwordTextField.textColor = .black

		toggleLoginButton(on: false)
	}
}
