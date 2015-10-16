//
//  main.swift
//  Domain Modeling
//
//  Created by Teddy Pappas on 10/14/15.
//  Copyright © 2015 Teddy Pappas. All rights reserved.
//

import Foundation


//Structure Money has an amount and a type of currency
//Functions convert, add, and subtract change the amount and type of currency

struct Money {
    var amount = 1.0
    var currency = ""

func convert (var amount1: Money, convertCurr: String) -> Money {
    var conversion = 1.0
    var newCurr = ""
    if amount1.currency == convertCurr {
        return amount1
    } else {
        if amount1.currency == "USD" {
            if convertCurr == "GBP" {
                conversion = 2
                newCurr = "GBP"
            } else if convertCurr == "EUR" {
                conversion = (2/3)
                newCurr = "EUR"
            } else if convertCurr == "CAN" {
                conversion = (4/5)
                newCurr = "CAN"
            }
        } else if amount1.currency == "GBP" {
            if convertCurr == "USD" {
                conversion = (1/2)
                newCurr = "USD"
            } else if convertCurr == "EUR" {
                conversion = (1/3)
                newCurr = "EUR"
            } else if convertCurr == "CAN" {
                conversion = (2/5)
                newCurr = "CAN"
            }
        } else if amount1.currency == "EUR" {
            if convertCurr == "GBP" {
                conversion = (3/2)
                newCurr = "GBP"
            } else if convertCurr == "USD" {
                conversion = (3)
                newCurr = "USD"
            } else if convertCurr == "CAN" {
                conversion = (6/5)
                newCurr = "CAN"
            }
        } else if amount1.currency == "CAN" {
            if convertCurr == "GBP" {
                conversion = (5/4)
                newCurr = "GBP"
            } else if convertCurr == "EUR" {
                conversion = (5/2)
                newCurr = "EUR"
            } else if convertCurr == "USD" {
                conversion = (5/6)
                newCurr = "USD"
            }
        }
    }
    let newAmount = amount1.amount * conversion
    amount1.amount = newAmount
    amount1.currency = newCurr
    return amount1
}


func add (var amount1: Money, var amount2: Money) -> Money {
    var newAmount = 0.0
    if amount1.currency == amount2.currency {
        newAmount = amount1.amount + amount2.amount
    } else {
        if amount1.currency == "USD" {
            amount2 = convert(amount2, convertCurr: "USD")
            newAmount = amount1.amount + amount2.amount
            
        } else if amount1.currency == "GBP" {
            amount2 = convert(amount2, convertCurr: "GBP")
            newAmount = amount1.amount + amount2.amount
            
        } else if amount1.currency == "CAN" {
            amount2 = convert(amount2, convertCurr: "CAN")
            newAmount = amount1.amount + amount2.amount
        
        } else if amount1.currency == "GBP" {
            amount2 = convert(amount2, convertCurr: "GBP")
            newAmount = amount1.amount + amount2.amount
        }

    }
    amount1.amount = newAmount
    return amount1
}

func subtract (var amount1: Money, var amount2: Money) -> Money {
    var newAmount = 0.0
    if amount1.currency == amount2.currency {
        newAmount = amount1.amount - amount2.amount
    } else {
        if amount1.currency == "USD" {
            amount2 = convert(amount2, convertCurr: "USD")
            newAmount = amount1.amount - amount2.amount
            
        } else if amount1.currency == "GBP" {
            amount2 = convert(amount2, convertCurr: "GBP")
            newAmount = amount1.amount - amount2.amount
            
        } else if amount1.currency == "CAN" {
            amount2 = convert(amount2, convertCurr: "CAN")
            newAmount = amount1.amount - amount2.amount
            
        } else if amount1.currency == "GBP" {
            amount2 = convert(amount2, convertCurr: "GBP")
            newAmount = amount1.amount - amount2.amount
        }
        
    }
    amount1.amount = newAmount
    return amount1
}
}

var billsMoney = Money(amount: 12.0, currency: "USD")
var tedsMoney = Money(amount: 5.0, currency: "GBP")

//convert(billsMoney, convertCurr: "EUR")
billsMoney.convert(billsMoney, convertCurr: "EUR")

var testAddAmount = Money(amount: 0, currency: "")
testAddAmount = billsMoney.add(billsMoney, amount2: tedsMoney)
print(testAddAmount.amount)
print(testAddAmount.currency)

var testSubAmount = Money(amount: 0, currency: "")
testSubAmount = billsMoney.subtract(billsMoney, amount2: tedsMoney)
print(testSubAmount.amount)
print(testSubAmount.currency)


//Job class
//has a title, salary, and if they are paid on a per-hour basis or yearly salary
//function calculateIncome takes in the number of hours and calculates the income they make based on salary
//function raise changes salary based on number passed

class Job {
    let title : String
    var salary : Double
    var salaryBasis : String
    init(a: String, b: Double, c: String) {
        title = a
        salary = b
        salaryBasis = c
    }
    
    func calculateIncome (hours: Double) -> Double {
        var income = 0.0
        if salaryBasis == "per-hour"{
            income = salary * hours
        } else if salaryBasis == "per-year"{
            income = salary
        }
        return income
    }
    
    func raise (percent: Double) {
        
        salary = ((percent/100) + 1) * salary
    }
}

var teacher = Job(a: "lecturer", b: 35.0, c: "per-hour")
print(teacher.calculateIncome(10))
teacher.raise(15)
print(teacher.salary)





//Person class
//has first and last name, age, job, spouse
//to string function
class Person {
    var firstName : String
    var lastName : String
    var age : Int
    var job : Job?
    var spouse : Person?
    init(a: String, b: String, c: Int, d: Job?, e: Person?) {
        firstName = a
        lastName = b
        age = c
        job = d
        spouse = e
    }
    
    func toString () {
        print("Name: " + firstName + " " + lastName)
        print("Age: \(age)")
        if age > 15 {
            if job != nil {
                print("Job: \((job?.title)!)")
            } else {
                print("Job: None")
            }
        }
        if age > 17 {
            if spouse != nil {
                print("Spouse: \((spouse?.firstName)!) \((spouse?.lastName)!)")
            } else {
                print("Spouse: None")
            }
        }
    }

}

var joe = Person(a: "Joe", b: "Miller", c: 40, d: teacher, e: nil)
var jane = Person(a: "Jane", b: "Miller", c: 43, d: teacher, e: joe)
var billy = Person(a: "Billy", b: "Miller", c: 12, d: nil, e: nil)
joe.toString()
jane.toString()
billy.toString()






//Family class
//holds an array of family members
//function householdIncome computes the household income of a family
//function haveChild and adds a new person to a family
class Family {
    var members : [Person]
    init(a: [Person]) {
        members = a
    }
    
    func householdIncome() -> Double{
        var total: Double = 0.0
        var temp: Double
        for member in members {
            if member.job != nil {
                temp = (member.job?.calculateIncome(2000))!
                total += temp
            }
        }
        return total
    }
    func haveChild(firstName: String, lastName: String) {
        let newKid = Person(a: firstName, b: lastName, c: 0, d: nil, e: nil)
        members.append(newKid)
    }
}

var theMillers = Family(a: [joe, jane, billy])

print(theMillers.householdIncome())

theMillers.haveChild("Josh", lastName: "Miller")

for element in theMillers.members {
    element.toString()
}





