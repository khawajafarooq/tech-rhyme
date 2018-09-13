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


var ts = TwoStack<Int>()
ts.push1(5)
ts.push2(10)
ts.push2(15)
ts.push1(11)
ts.push2(7)
ts.pop1()
ts.pop2()
ts.pop2()
ts.pop1()
ts.pop2()

prefix("* 2 3 + 4")
//: [Next](@next)

//: [Next](@next)
