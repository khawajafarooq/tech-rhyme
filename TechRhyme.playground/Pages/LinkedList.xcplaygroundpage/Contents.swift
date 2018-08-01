//: [Previous](@previous)

import Foundation

// Tests
var ll = LinkedList<String>()
ll.append("A")
ll.append("D")
ll.append("B")
ll.prepend("Í")
ll.delete(with: "A")
print(ll)
//ll.delete(with: "Í")
ll.reverse()
print(ll)

var ll2 = LinkedList<String>()
ll2.reverse()
print(ll2)
//: [Next](@next)
