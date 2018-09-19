//: [Previous](@previous)

import Foundation


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

duplicate([0,1,2,5,3,1,3,0])

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

duplicate([0,1,2,5,3,1,1,1,3], 4)

// Reverse an array
// Input: A = [2, 6, 3, 1, 7]
// Output: A = [7, 1, 3, 6, 2]

let A = [2, 6, 3, 1, 7]
func reverser<T>(_ array: [T]) -> [T] {
    
    guard array.count > 1 else { return array }
    
    var a = array
    
    var result: [T] = []
    array.forEach { _ in
        result.append(a.removeLast())
    }
    
    return result
}

reverser(A)

// Array left rotation
// Input: A = [2, 6, 3, 1, 7], d = 2
// Output: A = [3, 1, 7, 2, 6]

func leftRotation<T>(_ array:[T], d: Int) -> [T] {
    var result = array
    
    guard array.count > 1 else { return array }
    
    for _ in 1...d {
        result.append(result.removeFirst())
    }
    
    return result
}

leftRotation(A, d: 2)

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

leftRotation(A, d: 2)

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

//rightRotationMod(A, d: 2)

// shuffle an array
//func shuffle<T:Comparable>(_ a:[T]) -> [T] {
//    var array = a
//    guard !array.isEmpty else { return array }
//
//    // loop throughout the array
//    // get random index
//    // swap current index with random index
//    var last = array.count - 1
//    while (last > 0) {
//        let rand = Int.random(in: 0..<last)
//        array.swapAt(last, rand)
//        last -= 1
//    }
//
//    return array
//}

//shuffle(["A", "B", "C", "D", "F", "M", "P"])
//shuffle([1,4,3,6,8,10])


var m = [1,4,3,6,8,10]
//m.shuffle() // swift 4.2

// Find two maximum from array
func findTwoMax(_ array: [Int]) -> (Int, Int)? {
    guard array.count > 1 else {
        return nil
    }
    
    var max = Int.min
    var secondMax = Int.min
    
    for i in 0..<array.count {
        
        if max < array[i] {
            secondMax = max
            max = array[i]
        }
        else if secondMax < array[i] {
            secondMax = array[i]
        }
    }
    
    return (max, secondMax)
}

findTwoMax([1,12,3,7,6,5,8,14])

func twoMax(_ array: [Int]) -> (Int, Int)? {
    guard array.count > 1 else { return nil }
    
    let max = array.max()!
    var secondMax = Int.min

    array.forEach { element in
        if secondMax < element &&
            element < max {
            secondMax = element
        }
    }
    
    return (max, secondMax)
}

let p = [1,12,3,7,6,5,8,14]
twoMax(p)


// Add a number to array
/* Test Cases
 Input: [1, 2, 3, 4]
 Output: [1, 2, 3, 5]
 
 Input: [1, 2, 9, 9]
 Output: [1, 3, 0, 0]
 
 Input: [9, 9, 9, 9]
 Output: [1, 0, 0, 0]
 
 Input: []
 Output: [1]
 */

// if 9 then carry
// otherwise add 1
// if complete number is greater than add array
func addOneNumber(_ array: [Int]) -> [Int] {
    
    // if empty input
    guard !array.isEmpty else { return [1] }
    
    var carry = 1
    var result: [Int] = array.reversed().map {
        let sum = $0 + carry
        
        if sum == 10 {
            carry = 1
            return 0
        } else {
            carry = 0
            return sum
        }
    }
    // Corner Case:
    // if all of the values are 9
    if carry != 0 {
        result.append(carry)
    }
    
    return result.reversed()
}

//A = [1, 2, 9, 9]
addOneNumber([9,9,9,9,1,2])


// Two sum problem

// Input: A = [0,9,5,2], target = 7
// Output: [5,2]
// brute-force

func twoSum1(_ array: [Int], target: Int) -> [Int] {

    var times = 0
    for value1 in array {
        for value2 in array where value2 != value1  {
            times += 1
            if value1 + value2 == target {
                return [value1, value2]
            }
        }
    }

    return []
}
twoSum1([0,5,2,9], target: 10)

func twoSum2(_ array: [Int], target: Int) -> [Int] {
    let result = array.filter { array.contains(target-$0) }
    return result.count > 1 ? result: []
}

twoSum2([0,5,2,9], target: 10)

//func twoSum(_ array: [Int], target: Int) -> [Int] {
//
//    var dict: [Int: Int] = [:]
//    for value in array {
//        let diff = target - value
//        if let val = dict[value] {
//            return [val, value]
//        } else {
//            dict[diff] = value
//        }
//    }
//
//    return []
//}
//
//twoSum([0,9,5,2,1], target: 10)

//func duplicate(_ a1: [Int], _ a2: [Int]) -> [Int] {
//    return a1.filter{ return a2.contains($0) }
//}

//duplicate([0,9,5,2,1,33], [5,7,0,10,12,33])

func duplicate(_ a1: [Int], _ a2: [Int]) -> [Int] {
    return Set(a1).intersection(Set(a2)).map { $0 }
}

//let DS1 = Array(0...100000).filter { $0 % 2 == 0 }
//let DS2 = Array(0...100000).filter { $0 % 2 == 0 }
//duplicate(DS1, DS2)


struct Interval {
    let start: Int
    let end: Int
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

extension Interval: Equatable {
    static func == (lhs: Interval, rhs: Interval) -> Bool {
        return lhs.start == rhs.start && lhs.end == rhs.end
    }
}

extension Interval: CustomStringConvertible {
    var description: String {
        return """
        (\(start),\(end))
        """
    }
}

// Merge intervals
func mergeIntervals(_ a:[Interval]) -> [Interval] {

    var array = a.sorted(by: { $0.start < $1.start })
    var stack: [Interval] = []
    stack.append(array[0])
    for interval in array where interval != array[0] {

        let top = stack.last!
        if top.end < interval.start {
            // push
            stack.append(interval)
        } else if top.end < interval.end {
            // update
            stack.removeLast()
            stack.append(Interval(top.start, interval.end))
        }
    }

    return stack
}

let intervals = [
    Interval(1,3),
    Interval(6,8),
    Interval(5,7),
    Interval(5,7),
    Interval(2,4)
]

//let intervals = [
//    Interval(6,8),
//    Interval(1,9),
//    Interval(2,4),
//    Interval(2,4),
//    Interval(4,7)
//]

print(mergeIntervals(intervals))
//: [Next](@next)

