import Foundation

public class Stack<T: Equatable> {
    private var list = [T]()
    
    public init() {}
    public var count: Int {
        return list.count
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var top: T? {
        return list.last
    }
    
    public func push(_ element: T) {
        list.append(element)
    }
    
    public func pop() -> T? {
        if !isEmpty {
            return list.removeLast()
        }
        return nil
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        guard !isEmpty else {
            return "Stack is empty"
        }
        
        var print = ""
        for item in list.reversed() {
            
            print += "|\(item)|"
            
            if item == top! {
                print += " -> Top"
            }
            
            print += "\n---\n"
        }
        
        return print
    }
}

public struct MyStack<Element> {
    private var elements:[Element] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var top: Element? {
        return elements.last
    }
    
    public mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    public mutating func pop() -> Element? {
        if !isEmpty {
            return elements.removeLast()
        }
        return nil
    }
}

extension MyStack: Collection {
    public var startIndex: Int {
        return elements.startIndex
    }
    
    public var endIndex: Int {
        return elements.endIndex
    }
    
    public subscript(index: Int) -> Element {
        return elements[index]
    }
    
    public func index(after i: Int) -> Int {
        return elements.index(after: i)
    }
}

/*
 
 top (index)
 count
 store sequentially
 
 s1 = 2(top)
 s2 = 5(top)
 2,5,3
 swap top2 with top1 (index + array value)
 2,3,5
 
 2,3,5,8
 
 append after top1, update top1, count1
 append after top2, update top2, count1
 
 pop - from top to count
 
 
 stack = TwoStack
 stack.push1(2)
 stack.push2(5)
 stack.push1(3)
 stack.push2(8)
 stack.push1(9)
 stack.push1(5) - top1
 stack.push2(7)
 stack.push2(1) - top2
 
 */

public struct TwoStack<Element> {
    private var elements: [Element] = []
    
    private var top1: Int = -1
    private var top2: Int = -1
    
    public init() {}
    
    public mutating func push1(_ value: Element) {
        
        top1 += 1
        top2 += 1
        push(value, at: top1)
    }
    
    public mutating func push2(_ value: Element) {
        top2 += 1
        push(value, at: top2)
    }
    
    public mutating func pop1() -> Element? {
        top1 -= 1
        top2 -= 1
        return pop(at :top1+1)
    }
    
    public mutating func pop2() -> Element? {
        top2 -= 1
        return pop(at :top2+1)
    }
    
    
    // MARK: - helper methods
    private mutating func push(_ value: Element, at index: Int) {
        elements.insert(value, at: index)
    }
    
    private mutating func pop(at index: Int) -> Element? {
        
        guard index > -1 else { return nil }
        return elements.remove(at: index)
    }
    
}





