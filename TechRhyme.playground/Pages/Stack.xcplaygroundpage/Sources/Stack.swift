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
