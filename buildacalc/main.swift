//
//  main.swift
//  buildacalc
//
//  Created by Morgan Evans on 10/13/15.
//  Copyright (c) 2015 Morgan Evans. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

// convert strings to integers
func convert(incoming : String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

// generic add function
func add(x : Int, y : Int) -> Int {
    return x + y
}

// generic substraction function
func substract(x : Int, y : Int) -> Int {
    return x - y
}

// generic multiplication function
func multiply(x : Int, y : Int) -> Int {
    return x * y
}

// generic division function
func divide(x : Int, y : Int) -> Int {
    return x / y
}

// generic math operation function
func mathOp(x : Int, y : Int, op : (Int, Int) -> Int) -> Int {
    return op(x, y)
}

// calculate generic math operations
func calculate(operand : String, x : Int, y : Int) -> Int {
    switch operand {
    case "+":
        return x + y
    case "-":
        return x - y
    case "*":
        return x * y
    case "/":
        if (y == 0) {
            print("You cannot divide by 0.")
        } else {
            return x / y
        }
    default:
        print("Please enter a valid operation to be computed.")
    }
}

// calculate the number of elements and/or average value of all elements
func multipleOperand(operation:[String]) -> Int {
    switch operation[operation.count - 1] {
    case "count":
        return operation.count - 1
    case "avg":
        var sum = 0
        for var i = 0; i < operation.count - 1; i++ {
            sum = sum + convert(operation[i])
        }
        return sum / (operation.count - 1)
  /*  case "fact":
        if operation.count > 2 {
            print("Please enter only one number to be calculated.")
            return 0
        } else {
            var fact = convert(operation[0]);
            for var i = convert(operation[0]); i > 1; i-- {
                fact *= i - 1
            }
            return fact
        }*/
    default:
        print("Please enter correct values and try again.")
        return 0
    }
}

// add function with an array of integers, that adds all elements
func addArray(x : [Int]) -> Int {
    var result : Int = 0
    for var i = 0; i < x.count; i++ {
        result += x[i]
    }
    return result
}

// multiply function with an array of integers, that multiples all elements
func multiplyArray(x : [Int]) -> Int {
    var result : Int = 1
    for var i = 1; i < x.count; i++ {
        result *= x[i]
    }
    return result
}

// count the number of elements in the array
func arrayCount(x : [Int]) -> Int {
    return x.count
}

// average the values all of the elements in the array
func arrayAvg(x : [Int]) -> Int {
    return addArray(x) / arrayCount(x)
}

// generic math operation function that takes an array of integers
func mathOpArray(op : ([Int]) -> Int, x : [Int]) -> Int {
    return op(x)
}

// add two tuples of integers together

func addIntTuples(pointOne : (Int, Int), pointTwo : (Int, Int)) -> (Int, Int) {
    return (pointOne.0 + pointTwo.0, pointOne.1 + pointTwo.1)
}

// add two tuples of doubles together
func addDoubleTuples(pointOne : (Double, Double), pointTwo : (Double, Double)) -> (Double, Double) {
    return (pointOne.0 + pointTwo.0, pointOne.1 + pointTwo.1)
}

// subtract one tuple of integers from another
func subtractIntTuples(pointOne : (Int, Int), pointTwo : (Int, Int)) -> (Int, Int) {
    return (pointOne.0 - pointTwo.0, pointOne.1 - pointTwo.1)
}

// substract one tuple of integers from another
func subtractDoubleTuples(pointOne : (Double, Double), pointTwo : (Double, Double)) -> (Double, Double) {
    return (pointOne.0 - pointTwo.0, pointOne.1 - pointTwo.1)
}

// add dictionaries


//substract dictionaries

// console input and output
print("Please enter an expression to be calculated:")

var firstInput = input()
let operand = input()
var secondInput = input()
let nums = input().componentsSeparatedByString(" ")

if (nums.count == 1) {
    let x = convert(firstInput)
    let y = convert(secondInput)
    let result = calculate(operand, x : x, y : y)
    print("Answer: \(result)")
} else {
    let otherResult = multipleOperand(nums)
    print(otherResult)
}