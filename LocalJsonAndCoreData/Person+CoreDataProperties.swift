//
//  Person+CoreDataProperties.swift
//  LocalJsonAndCoreData
//
//  Created by Abhimanyu Kumar Chauhan on 04/12/18.
//  Copyright © 2018 Abhimanyu Kumar Chauhan. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequestForPerson() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "PersonCore")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var addressDetailRelation: NSSet?

}

// MARK: Generated accessors for addressDetailRelation
extension Person {

    @objc(addAddressDetailRelationObject:)
    @NSManaged public func addToAddressDetailRelation(_ value: Address)

    @objc(removeAddressDetailRelationObject:)
    @NSManaged public func removeFromAddressDetailRelation(_ value: Address)

    @objc(addAddressDetailRelation:)
    @NSManaged public func addToAddressDetailRelation(_ values: NSSet)

    @objc(removeAddressDetailRelation:)
    @NSManaged public func removeFromAddressDetailRelation(_ values: NSSet)

}
