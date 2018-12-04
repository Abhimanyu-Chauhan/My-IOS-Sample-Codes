//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Superhero {
    let firstName: String
    let lastName: String
    let age: Int
    var power: Int
}

let superman = Superhero(firstName: "Clark", lastName: "Kent", age: 35, power: 100)
let batman = Superhero(firstName: "Bruce", lastName: "Wayne", age: 32, power: 90)

extension Superhero: Comparable {
    static func < (lhs: Superhero, rhs: Superhero) -> Bool {
        print("called")
        return lhs.power < rhs.power
    }
    static func == (lhs: Superhero, rhs: Superhero) -> Bool {
        return lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.age == rhs.age
    }
}

let superheroes = [superman, batman]
let isSupermanTopOne = superman.power > batman.power
superheroes.sorted(by: {$0.power < $1.power })


let isSupermanTopOne2 = superman > batman
superheroes.sorted()
