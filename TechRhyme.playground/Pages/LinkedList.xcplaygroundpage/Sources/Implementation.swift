import Foundation

public class Node<T: Comparable> {
    let data: T
    var next: Node? = nil
    
    init(data: T) {
        self.data = data
    }
}

public struct LinkedList<T: Comparable> {
    
    var head: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    public init() {}
    
    mutating public func append(_ data: T) {
        guard head != nil else {
            self.head = Node<T>(data: data)
            return
        }
        append(Node<T>(data: data))
    }
    
    mutating public func append(_ node: Node<T>) {
        var current = head!
        while (current.next != nil) {
            current = current.next!
        }
        current.next = node
    }
    
    mutating public func prepend(_ data: T) {
        let newHead = Node<T>(data: data)
        newHead.next = head
        head = newHead
    }
    
    mutating public func delete(with data: T) {
        
        guard let head = head else { return }
        guard head.data != data else {
            self.head = head.next
            return
        }
        
        var current = head
        while (current.next != nil) {
            if current.next?.data == data {
                current.next = current.next?.next
                return
            }
            current = current.next!
        }
        
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard head != nil else {
            return """
            LINKED LIST EMPTY 🚫
            """
        }
        
        var result = "\(head!.data)->"
        
        var current = head
        
        while (current?.next != nil) {
            
            current = current?.next!
            result.append("\(current!.data)->")
        }
        result.append("nil")
        return result
        
    }
}
