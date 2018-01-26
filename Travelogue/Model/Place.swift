//
//  Place.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class Place: BaseObject {
    @objc dynamic var name = ""
    @objc dynamic var visited = false
    @objc dynamic var country: Country?
}
