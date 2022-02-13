//
//  NamesTableViewController.swift
//  lesson3_Rx
//
//  Created by Dmitry Aksyonov on 13.02.2022.
//

import UIKit

class NamesViewController: UITableViewController {

	@IBOutlet weak var addNameButton: UIBarButtonItem!
	@IBOutlet weak var deleteNameButton: UIBarButtonItem!

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 0
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}

}
