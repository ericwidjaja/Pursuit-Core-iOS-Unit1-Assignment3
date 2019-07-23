//
//  main.swift
//  Calculator
//
//  Created by Eric Widjaja on 7/18/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//
import Foundation
var operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
                                                          "-": { $0 - $1 },
                                                          "*": { $0 * $1 },
                                                          "/": { $0 / $1 }]
var calcProject = true
    print("""


    🧮 Calculator Project 🧮


    """)

while calcProject {

    func mainMenu() {
        print("Choose type of calculator: \n [1]  Regular \n [2]  Guess the Operator \n [3]  High Order \n\n")
        let calculatorType = readLine()
        if let choice = calculatorType {
            switch choice {
            case "1", "[1]", "Regular":
                regularCalculator()
            case "2", "[2]", "Guess the Operator":
                guessOperator()
            case "3", "[3]", "High Order":
                highOrderCalculator()
            default:
                print("Sorry, wrong answer, please try again!\n")
                mainMenu()
            }
        }
    }
    mainMenu()

    func calcAgain() {
        print("Would you like to calculate again? (Yes) or (No)? \n")
        let calculatorType = readLine()
        if let choice = calculatorType {
            switch choice {
            case "Yes","Y","y","1":
                mainMenu()
            case "No","N","n","2":
                print("Thank you \n")
                calcProject = false
            default:
                print("Sorry, wrong answer, please try again...")
                calcAgain()
            }
        }
    }
    func mathOperation(num1: Double, operatorInput: String, num2: Double) -> Double {
        switch operatorInput {
            
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "*":
            return num1 * num2
        case "/":
            return num1 / num2
        default: return Double()
        }
    }
    func regularCalculator() {
        print("Enter your operation, i.e.; 11 * 3 \n")

        var operand1 = Double ()
        var operand2 = Double ()
        if let userInput = readLine()?.components(separatedBy:" ") {
        
            if userInput.count != 3 {
                print("Sorry...Please enter two numbers and one operator, using this format 11 * 4")
                regularCalculator()
            }
            if let num1Double = Double(userInput[0]) { //check if input is a Double
                operand1 = num1Double
            } else {
                print("Sorry, wrong input")
                regularCalculator()
            }
            if let num2Double = Double(userInput[2]) {
                operand2 = num2Double

            } else {
                print("Sorry, wrong Input")
                regularCalculator()
            }
            if inputOperator == "?" {
                guessOperator( x: operand1, y: operand2)
            }
            if inputOperator != "+" && inputOperator != "-" && inputOperator != "*" && inputOperator != "/" {
                print("Error, please use the right operator sign")
                regularCalculator()
            }
            let inputOperator = (userInput[1])
            print("\(operand1) \(inputOperator) \(operand2) = \(mathOperation(num1: operand1, operatorInput: inputOperator, num2: operand2))")
        
        calcAgain()
        }
    }
    func guessOperator() {
        print("Can you guess the operator used for this math operation?")
        calcAgain()
    }
    func highOrderCalculator() {
        print("Enter your high order operation")
        calcAgain()
        }
}
