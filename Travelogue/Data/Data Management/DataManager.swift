//
//  DataManager.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import Foundation
import RealmSwift

// swiftlint:disable force_try
struct DataManager {

    private static var _defaultRealm = try! Realm()

    static func defaultRealm() -> Realm {
        return DataManager._defaultRealm
    }

    private static func safeWrite() {
        do {
            try _defaultRealm.commitWrite()
        } catch {
            print("Realm error: \(error)")
        }
    }

    static func saveChanges(data: () -> Void) {
        defaultRealm().beginWrite()
        data()
        DataManager.safeWrite()
    }
}
