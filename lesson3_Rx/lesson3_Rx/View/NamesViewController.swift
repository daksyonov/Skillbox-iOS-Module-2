//
//  NamesTableViewController.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 13.02.2022.
//

import UIKit

final class NamesViewController: UIViewController {

	@IBOutlet weak var addNameButton: UIBarButtonItem!
	@IBOutlet weak var deleteNameButton: UIBarButtonItem!
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

extension NamesViewController: UITableViewDelegate {


}
