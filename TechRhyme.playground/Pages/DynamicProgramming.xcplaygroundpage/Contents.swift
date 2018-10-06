//: [Previous](@previous)

import Foundation

// LCS
// Recursion
func LCS(_ A: [Int], _ B: [Int], _ i: Int, _ j: Int) -> Int {
    
    guard i < A.count, j < B.count else { return 0 }
    
    if A[i] == B[j] {
        return 1 + LCS(A, B, i+1, j+1)
    } else {
        return max(LCS(A, B, i+1, j), LCS(A, B, i, j+1))
    }
    
}

let A = [6,2,3,1,9,4,0]
let B = [2,1,0]
LCS(A,B,0,0)

//: [Next](@next)
