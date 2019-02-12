//
//  RegionTableViewController
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController, TableViewConfigurable {

    let regionTableView = UITableView()
    let regions = DataManager.defaultRealm().objects(Region.self)
    let regionSearchResultController = UIViewController()
    lazy var regionSearchController: UISearchController = {
       let searchController = UISearchController(searchResultsController: self.regionSearchController)
        return searchController
    }()

    // here is the chnge
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView(regionTableView)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        regionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        title = "Regions"

    }
}

// MARK: - UITableViewDataSource
extension RegionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = regions[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension RegionViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let region = regions[indexPath.row]
        let countryViewController = CountryViewController(region)
        navigationController?.pushViewController(countryViewController, animated: true)
    }
}
