//
//  Address+CoreDataProperties.swift
//  LocalJsonAndCoreData
//
//  Created by Abhimanyu Kumar Chauhan on 04/12/18.
//  Copyright © 2018 Abhimanyu Kumar Chauhan. All rights reserved.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "AddressCore")
    }

    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var street: String?
    @NSManaged public var personRelation: Person?

}
