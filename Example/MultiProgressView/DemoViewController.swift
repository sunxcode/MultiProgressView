//
//  DemoViewController.swift
//  MultiProgressView_EXample
//
//  Created by Mac Gallagher on 2/18/19.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import UIKit

class DemoViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Demos"
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "iPhone Storage Demo"
        case 1:
            cell.textLabel?.text = "Other Demo"
        default:
            break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(StorageExampleViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(OtherExampleViewController(), animated: true)
        default:
            break
        }
    }
}
