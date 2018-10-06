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


func fizzbuzz(_ input: Int) -> String {
    
    let fizz = (input % 3 == 0)
    let buzz = (input % 5 == 0)
    
    switch (fizz, buzz) {
    case (true, false): return "fizz"
    case (false, true): return "buzz"
    case (true, true): return "fizzbuzz"
    default: return String(input)
    }
}

func fizzbuzzRecursion(_ a: [Int]) {
    
    guard a.count > 0 else { return }
    var array = a
    let value = array.removeFirst()
    print(fizzbuzz(value))
    fizzbuzzRecursion(array)
}


//for i in 1...100 {
//    print(fizzbuzz(i))
//}

fizzbuzzRecursion(Array(1...100))

//func count(of word: String, in input: String) -> Int {
//
//    var j = 0
//    var counter = 0
//    for i in 0..<input.count {
//
//        if input[id] == word[jd] {
//            j += 1
//        } else {
//            j = 0
//        }
//
//        if j == word.count-1 {
//            counter += 1
//            j = 0
//        }
//    }
//
//    return counter
//}

//count(of: "hello", in: "abcahellomhellooi0")

let testScores: [Int] = [100, 80]
func calculate() -> Character {
    
    let avgScore = testScores.reduce(0, +) / testScores.count
    
    switch true {
    case avgScore >= 90 && avgScore <= 100: return "O"
    case avgScore >= 80 && avgScore < 90: return "E"
    case avgScore >= 70 && avgScore < 80: return "A"
    case avgScore >= 55 && avgScore < 70: return "P"
    case avgScore >= 40 && avgScore < 55: return "D"
    default: return "T"
    }
}

calculate()


let q1 = [
    [1, 2, 100],
    [2, 5, 100],
    [3, 4, 100]
    
]

let q2 = [
    [2, 3, 603],
    [1, 1, 286],
    [4, 4, 882],
]

var q3: [[Int]] = [[]]
for i in 0...100000 {
    let item = i % 2 == 0 ? q1[0] : q2[2]
    q3.append(item)
}

func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    
    var zeroArray = Array(repeating: 0, count: n)
    
    var max = 0
    
    for query in queries {
        let a = query[0] - 1 // index
        let b = query[1] - 1 // index
        let k = query[2]
        
        guard a >= 0 && a < n else { return -1 }
        guard b >= 0 && b < n else { return -1 }
        guard a <= b else { return -1 }
        
        for i in a...b {
            zeroArray[i] += k
            
            if max < zeroArray[i] {
                max = zeroArray[i]
            }
        }
    }
    
    return max
}

arrayManipulation(n: 10000, queries: q3)



//: [Next](@next)

