//
//  UIView+Extensions.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 2/12/19.
//  Copyright © 2019 Josh Dubey. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func pinToSuperView() {
        guard let superView = self.superview else { return }
        superView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        superView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        superView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        superView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
