//: [Previous](@previous)

import Foundation

// Tests
var ll = LinkedList<String>()
ll.append("A")
ll.append("D")
ll.append("B")
ll.append("G")
ll.append(data: ":D", at: 1)
ll.append(data: ":O", at: 0)
//ll.delete(with: ":D")
print(ll)
//ll.delete(with: "Í")
ll.reverse()
print(ll)

