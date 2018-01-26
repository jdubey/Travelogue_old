//
//  TravelTabBarControllerViewController.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit

class TravelTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let checklistViewController = ChecklistViewController()
        let toVisitViewController = ToVisitViewController()
        toVisitViewController.title = "To Visit"
        self.viewControllers = [checklistViewController, toVisitViewController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITabBarControllerDelegate
extension TravelTabBarController: UITabBarControllerDelegate {

}
