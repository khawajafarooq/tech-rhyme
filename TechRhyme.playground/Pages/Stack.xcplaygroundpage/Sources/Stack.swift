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


