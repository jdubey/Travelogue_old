//
//  CountryViewController.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class CountryViewController: BaseViewController, TableViewConfigurable {

    let countryTableView = UITableView()
    let countries: [Country]
    let region: Region

    var imageView: UIImageView!

    init(_ region: Region) {
        self.region = region
        self.countries = region.countries.compactMap {$0}
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        self.region = Region()
        self.countries = [Country]()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = region.name
        configureTableView(countryTableView)
        countryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 281))

        imageView = UIImageView(frame: .zero)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(imageView)
        imageView.pinToSuperView()
        imageView.image = Region.imageDict[RegionName(rawValue: region.name)!]
        imageView.contentMode = .scaleAspectFill
        countryTableView.tableHeaderView = headerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - UITableViewDataSource
extension CountryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension CountryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let placeViewController = PlaceViewController(countries[indexPath.row])
        navigationController?.pushViewController(placeViewController, animated: true)
    }
}
