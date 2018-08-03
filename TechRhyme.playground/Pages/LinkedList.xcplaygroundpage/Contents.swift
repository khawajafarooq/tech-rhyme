//: [Previous](@previous)

import Foundation

// Tests
var ll = LinkedList<String>()
ll.append("A")
ll.append("D")
ll.append("B")
ll.append("G")
ll.append(data: "E", at: 1)
ll.append(data: "O", at: 0)
ll.delete(with: "E")
ll.delete(with: "O")
print(ll)

ll.reverse()
print(ll)

