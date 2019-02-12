//
//  ToVisitViewController.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit

class ToVisitViewController: UIViewController {

    var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageView = UIImageView(frame: .zero)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.pinToSuperView()
        imageView.image = Asset.europe.image
        imageView.contentMode = .center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
