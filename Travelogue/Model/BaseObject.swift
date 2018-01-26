//
//  BaseObject.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class BaseObject: Object {

    static func createInRealm<T: Object>(realm: Realm, value: Any = [:], update: Bool = false) -> T? {
        var newObject: T?
        do {
            try realm.write {
                newObject = realm.create(self, value: value, update: update) as? T
            }
        } catch {
            print("Failed to create object of type \(self)")
        }

        return newObject
    }
}
