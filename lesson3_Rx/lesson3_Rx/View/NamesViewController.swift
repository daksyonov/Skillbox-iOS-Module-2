//
//  NamesTableViewController.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 13.02.2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

// MARK: - VC

final class NamesViewController: UIViewController {

	// MARK: Properties & Lifecycle

	@IBOutlet private weak var namesTableView: UITableView!

	private var disposeBag = DisposeBag()

	override func viewDidLoad() {
		super.viewDidLoad()

		namesTableView.register(
			UITableViewCell.self,
			forCellReuseIdentifier: "cell"
		)
	}
}

// MARK: - Shake Menu Imp

extension NamesViewController {

	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		if motion == .motionShake {
			processMotionShake()
		}
	}

	private func processMotionShake(){
		let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
		let addNameAction = UIAlertAction(
			title: "Add Random Name",
			style: .default,
			handler: { _ in self.addBlock() }
		)
		let deleteNameAction = UIAlertAction(
			title: "Delete Last Name",
			style: .destructive,
			handler: { _ in self.deleteBlock() }
		)
		actionSheet.addAction(addNameAction)
		actionSheet.addAction(deleteNameAction)
		present(actionSheet, animated: true, completion: nil)
	}

	private func addBlock(){

	}

	private func deleteBlock(){

	}
}
