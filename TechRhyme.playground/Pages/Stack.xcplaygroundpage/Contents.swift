//: [Previous](@previous)

import Foundation

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(4)
stack.push(3)
stack.pop()
//print(stack)


var myStack = MyStack<Int>()
myStack.push(1)
myStack.push(2)
myStack.push(4)
myStack.push(3)
myStack.pop()

for item in myStack {
    print(item)
}
myStack.count
myStack.contains(4)
//: [Next](@next)

//: [Next](@next)
