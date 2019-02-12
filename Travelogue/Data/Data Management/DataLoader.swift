//
//  DataLoader.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import Foundation
import RealmSwift

class DataLoader: NSObject {

    var regionNames = [String]()

    func loadData(_ realm: Realm = DataManager.defaultRealm()) {
//        self.loadPlist()
        loadJson()
    }

    func loadPlist() {
//        let plistPath = Bundle.main.path(forResource: "A", ofType: "plist")
//        let plistData = FileManager.default.contents(atPath: plistPath!)
//
//        do {
//            let plist = try PropertyListSerialization.propertyList(from: plistData!, options: PropertyListSerialization.MutabilityOptions.mutableContainers, format: nil)
//            if let dict = plist as? [String: Any] {
//                DataManager.saveChanges {
//
//                if let regions = (dict["Regions"]) as? [[String: String]] {
//                    regions.forEach({ (regionDict) in
//                        let region = Region()
//                        if let name = regionDict["name"] {
//                            region.name = name
//                        }
//                        DataManager.defaultRealm().add(region)
//                        if let countries = dict["Countries"] as? [[String: String]] {
//                            countries.forEach({ (countriesDict) in
//                                if let countryRegion = countriesDict["region"], let countryName = countriesDict["name"] {
//                                    if region.name == countryRegion {
//                                        let country = Country()
//                                        DataManager.defaultRealm().add(country)
//                                        country.name = countryName
//                                        country.region = region
//                                    }
//                                }
//                            })
//                        }
//                    })
//                }
//            }
//            }
//            print(plist)
//
//            do {
//                let decoder = PropertyListDecoder()
//                let dataList = try decoder.decode(AppPropertyList.self, from: plistData!)
//                print(dataList)
//            }
//            catch {
//                print(error.localizedDescription)
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
    }

    func loadJson() {
        let jsonPath = Bundle.main.path(forResource: "AppData", ofType: "json")
        let jsonData = FileManager.default.contents(atPath: jsonPath!)

        do {
            let decoder = JSONDecoder()
            let entries = try decoder.decode([Entry].self, from: jsonData!)
            print(entries)
            DataManager.saveChanges {
            let realm = DataManager.defaultRealm()
            // Create objects
            for entry in entries {
                // Create region if not created
                    let region = Region()
                    region.name = entry.region
                    region.id = entry.id
                    realm.add(region, update: true)
                // Create country if not created
                    let country = Country()
                    country.name = entry.country
                country.id = entry.id
                    realm.add(country, update: true)
                // Create place if not created
                    let place = Place()
                place.id = entry.id
                    place.name = entry.place
                    realm.add(place, update: true)
            }

            // Create relationships
            for entry in entries {
                if let place = realm.objects(Place.self).filter(NSPredicate(format: "name = %@", entry.place)).first,
                    let country = realm.objects(Country.self).filter(NSPredicate(format: "name = %@", entry.country)).first,
                    let region = realm.objects(Region.self).filter(NSPredicate(format: "name = %@", entry.region)).first {
                    place.country = country
                    country.region = region
                }
            }
            }
//            let plist = try PropertyListSerialization.propertyList(from: plistData!, options: PropertyListSerialization.MutabilityOptions.mutableContainers, format: nil)
//            if let dict = plist as? [String: Any] {
//                DataManager.saveChanges {
//
//                    if let regions = (dict["Regions"]) as? [[String: String]] {
//                        regions.forEach({ (regionDict) in
//                            let region = Region()
//                            if let name = regionDict["name"] {
//                                region.name = name
//                            }
//                            DataManager.defaultRealm().add(region)
//                            if let countries = dict["Countries"] as? [[String: String]] {
//                                countries.forEach({ (countriesDict) in
//                                    if let countryRegion = countriesDict["region"], let countryName = countriesDict["name"] {
//                                        if region.name == countryRegion {
//                                            let country = Country()
//                                            DataManager.defaultRealm().add(country)
//                                            country.name = countryName
//                                            country.region = region
//                                        }
//                                    }
//                                })
//                            }
//                        })
//                    }
//                }
            } catch {
            print(error.localizedDescription)
        }
    }
}
