//
//  NamesTableViewController.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 13.02.2022.
//

import UIKit

// MARK: - VC

final class NamesViewController: UIViewController {

	// MARK: Properties & Lifecycle

	@IBOutlet weak var namesTableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		namesTableView.delegate = self
		namesTableView.dataSource = self
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


extension NamesViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		10
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell.init(
			style: .subtitle,
			reuseIdentifier: "cell"
		)

		cell.textLabel?.text = "aga"
		cell.detailTextLabel?.text = "fasfd"

		return cell
	}
}

extension NamesViewController: UITableViewDelegate { }
