//: [Previous](@previous)

import Foundation

func binarySearch<T: Comparable>(_ a: [T], _ key: T, _ range: Range<Int>) -> Int? {
    
    guard range.lowerBound < range.upperBound else { return nil }
    
    let mid = range.lowerBound + (range.upperBound - range.lowerBound)/2
    
    switch true {
    case a[mid] == key: return mid
    case a[mid] < key: return binarySearch(a, key, mid+1 ..< range.upperBound)
    case a[mid] > key: return binarySearch(a, key, range.lowerBound ..< mid)
    default: return nil
    }
}
let a = [2,4,5,7,8,12]
binarySearch(a, 12, 0..<a.count)

func linearSearch<T:Equatable> (_ a: [T], _ key: T) -> Bool {
    return a.filter{ return $0 == key }.count > 0
}
linearSearch(a, 8)
//: [Next](@next)
