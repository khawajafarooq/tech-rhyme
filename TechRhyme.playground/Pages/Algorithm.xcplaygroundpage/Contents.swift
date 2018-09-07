//: [Previous](@previous)

import Foundation

// brute force
func guess(number: Int, in range: ClosedRange<Int>) -> Int {
    
    var tries = 0
    for guess in range {
        
        if guess == number {
            break
        }
        
        tries += 1
    }
    
    return tries
}


guess(number: 10, in: 1...10)

// log(n) approach
func guess(the number: Int, in range: ClosedRange<Int>) -> Int {

    var tries = 0

    var start = range.lowerBound
    var end = range.upperBound

    while start <= end {

        tries += 1

        let mid = (start + end)/2
        
        if mid == number {
            break
        } else if mid < number {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }

    return tries
}

guess(the: 8, in: 1...10)

func guess(_ number: Int, _ range: ClosedRange<Int>, _ attempt: Int) -> Int {
    
    var tries = attempt
    
    guard range.lowerBound < range.upperBound else {
        return -1
    }
    
    let mid = (range.lowerBound + range.upperBound)/2
    
    tries += 1
    
    switch true {
    case mid == number: return tries
    case mid < number: return guess(number, mid+1...range.upperBound, tries)
    case mid > number: return guess(number, range.lowerBound...mid-1, tries)
    default: return -1
    }
}

guess(8, 1...10, 0)
//: [Next](@next)
