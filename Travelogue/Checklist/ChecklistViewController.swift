//
//  ChecklistViewController.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit

class ChecklistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Checklist"

        addNavigationController()
    }

    func addNavigationController() {
        let regionviewController = RegionViewController()
        let navController = UINavigationController(rootViewController: regionviewController)
        addChildViewController(navController)
        view.addSubview(navController.view)
        navController.didMove(toParentViewController: self)
    }
}
