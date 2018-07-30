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

// Array left rotation
// Input: A = [2, 6, 3, 1, 7], d = 2
// Output: A = [3, 1, 7, 2, 6]

func leftRotation<T>(_ array:[T], d: Int) -> [T] {
    var result: [T] = []
    
    array.forEach { _ in
        let element = result.remove(at: 0)
        result.append(element)
    }
    
    return result
}

// Rotation with index
// expected index: 2, 3, 4, 0, 1
// index = d + i % size
// 2, 3, 4, 0, 1
func leftRotationMod<T>(_ array:[T], d: Int) -> [T] {
    var result: [T] = []
    
    for i in 0..<array.count {
        let index = d + i % array.count
        result[i] = array[index]
    }
    
    return result
}

//leftRotation(A, d: 2)

// Array right rotation
// Input: A = [2, 6, 3, 1, 7], d = 2
// Output: A = [1, 7, 2, 6, 3]

// Rotation with index
// expected index: 3, 4, 0, 1, 2
// index = d + i + 1 % size
// 3, 4, 0, 1, 2

func rightRotationMod<T>(_ array:[T], d: Int) -> [T] {
    var result: [T] = []
    
    for i in 0..<array.count {
        let index = (d + i + 1) % array.count
        result.append(array[index])
    }
    
    return result
}

//: [Next](@next)
