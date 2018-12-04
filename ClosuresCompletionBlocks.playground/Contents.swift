//: Playground - noun: a place where people can play

import UIKit


func filterLesserThanValue(value: Int, numbers: [Int]) -> [Int] {
    var filteredSetOfNumbers = [Int]()
    for num in numbers {
        if num < value {
            filteredSetOfNumbers.append(num)
        }
    }
    return filteredSetOfNumbers
}

//Creating higher order function
func filterWithPredicateClosure(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var filterNumbers = [Int]()
    for num in numbers {
        //perform some condition check here
        if closure(num) {
            filterNumbers.append(num)
        }
    }
    return filterNumbers
}

func greaterThanThree(value: Int) -> Bool {
    return value > 3
}

func divisibleByFive(value: Int) -> Bool {
    return value % 5 == 0
}

//let filteredList = filterWithPredicateClosure(closure: greaterThanThree, numbers: [10, 5, 1, 2, 0])
let filteredList = filterWithPredicateClosure(closure: divisibleByFive, numbers: [20, 30, 1, 2, 9, 15])
print(filteredList)

let filteredList2 = filterWithPredicateClosure(closure: {(value) in value > 1}, numbers: [20, 30, 1, 2, 9, 15])
print(filteredList2)

//let filteredList = filterWithPredicateClosure(closure: { (num) -> Bool in
//    return num > 2
//}, numbers: [1, 2, 3, 4, 5, 10])


//let filteredList = filterLesserThanValue(value: 5, numbers: [1, 2, 3, 4, 5, 10])
//print(filteredList)


func addTwoNumbers(number1: Int, number2: Int) -> Int {
    return number1 + number2
}
var storedFunc = addTwoNumbers //Swift functions are described as a first-class function.
storedFunc(5, 9) // 14

var storedClosure: (Int, Int) -> Int = { (number1, number2) in
    return number1 + number2
}
storedClosure(5,9)

var secondClosureFunc:(Int, Int) -> Int = { (num1, num2) in
    return num1 + num2
}

// Shorter
var storedClosure1: (Int, Int) -> Int = { return $0 + $1 }
// Super Short
var storedClosure2: (Int, Int) -> Int = { $0 + $1 }


func insertSomething(closure: () -> String) {
    closure()
}

//Like completion handler
insertSomething(closure:{
    print("Hello World")
    return "Hello World"
})

//Or
insertSomething(){
    print("Hello World")
    return "Hello World"
}


func higherOrderFunction(array:[Int], closure:(Int) -> Bool ) -> [Int]{
    var tempArray = [Int]()
    for number in array{
        if closure(number){
            tempArray.append(number)
        }
    }
    
    return tempArray
}

let returnedFilteredArray = higherOrderFunction(array:[1,2,3,4,5,6,7]){
    return $0 > 1
}


// Global Closure (a.k.a function)
func timesTenFunc(number: Int) -> Int { return number * 10 }
// Normal Closure
var timesTenClosure: (Int) -> Int = { $0 * 10 }
// Test👆
timesTenFunc(number: 10) // 100
timesTenClosure(10) // 100


func sum(from: Int, to: Int, closure: (Int) -> (Int)) -> Int {
    var sum = 0
    for i in from...to {
        sum += closure(i)
    }
    return sum
}

sum(from: 0, to: 10, closure: timesTenFunc) // 550
sum(from: 0, to: 10, closure: timesTenClosure) // 550

// Longer Version
sum(from: 0, to: 10, closure: { number in return number * 10 })
// Shorter Version
sum(from: 0, to: 10, closure: { $0 * 10 })

//Trailing Closures
// a trailing closure can be used only if a function requires a closure as the final argument/parameter. You may trail (to follow behind) the closure argument parameter section. In other words, the final parameter is separated from the normal function parameter block.

// Trailing Closure Longer Version
sum(from: 0, to: 10) { (number) in
    return number * 10
}
// Trailing Closure Shorter Version
sum(from: 0, to: 10) { return $0 * 10}
// Trailing Closure Extremely Short Version
sum(from: 0, to: 10) { $0 * 10 } 

class A{
    var string1: String
    var string2: String!
    var string3: String?
    
    init(string1: String) {
        self.string1 = string1
    }
    
    func setString2ValueToNil(){
        string2 = nil
    }
}

let aInstance = A(string1: "Abhimanyu")
aInstance.string2 = "Blabala"
print(aInstance.string2)
aInstance.setString2ValueToNil()
print(aInstance.string2)
