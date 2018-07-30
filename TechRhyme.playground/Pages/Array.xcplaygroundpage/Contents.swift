//: [Previous](@previous)

import Foundation

//: Find Duplicates

func duplicate(_ array: [Int]) -> [Int] {
    
    guard !array.isEmpty else { return [] }
    
    var result: [Int] = []
    var dictionary: [Int: Int] = [:]
    
    for item in array {
        
        if let number = dictionary[item],
            !result.contains(number) {
            result.append(number)
        } else {
            dictionary[item] = item
        }
    }
    
    return result
}

//duplicate([0,1,2,5,3,1,3])

//: Find duplicates k times

func duplicate(_ array: [Int], _ k: Int) -> Int {
    
    var dict: [Int: Int] = [:]
    
    for item in array {
        
        if let count = dict[item] {
            dict[item] = count + 1
        } else {
            dict[item] = 1
        }
    }
    
    for (item, count) in dict {
        if count == k {
            return item
        }
    }
    
    return -1
}

//duplicate([0,1,2,5,3,1,1,1,3], 4)

// Reverse an array
// Input: A = [2, 6, 3, 1, 7]
// Output: A = [7, 1, 3, 6, 2]

func reverser<T>(_ array: [T]) throws -> [T] {
    
    guard array.count > 1 else { return array }
    
    var result: [T] = []
    var index = array.count-1
    
    while index >= 0 {
        result.append(array[index])
        index -= 1
    }
    
    return result
}

//reverser(A)

//: [Next](@next)
