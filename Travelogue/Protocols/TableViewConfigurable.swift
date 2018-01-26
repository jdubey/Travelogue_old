//
//  TableViewConfigurable.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit

protocol TableViewConfigurable: class {
    func configureTableView(_ tableView: UITableView)
}

extension TableViewConfigurable where Self: UIViewController, Self: UITableViewDelegate, Self: UITableViewDataSource {

    func configureTableView(_ tableView: UITableView) {
        tableView.frame = self.view.bounds
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}
