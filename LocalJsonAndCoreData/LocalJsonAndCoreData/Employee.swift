//
//  File.swift
//  LocalJsonAndCoreData
//
//  Created by Abhimanyu Kumar Chauhan on 03/12/18.
//  Copyright © 2018 Abhimanyu Kumar Chauhan. All rights reserved.
//

import Foundation


struct Employee: Codable{
    
    let employee:[Detail]
}

struct Detail: Codable{
    
    let firstName: String
    let lastName: String
    let address: [AddressStruct]
}

struct AddressStruct: Codable{
    
    let street: String
    let city: String
    let state: String
}
