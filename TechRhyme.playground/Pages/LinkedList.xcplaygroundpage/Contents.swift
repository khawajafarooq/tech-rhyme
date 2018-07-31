//: [Previous](@previous)

import Foundation

class Node<T> {
    let data: T
    var next: Node? = nil
    
    init(data: T) {
        self.data = data
    }
}

struct LinkedList<T> {
    
    var head: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ data: T) {
        guard head != nil else {
            self.head = Node<T>(data: data)
            return
        }
        append(Node<T>(data: data))
    }
    
    mutating func append(_ node: Node<T>) {
        
        guard let start = head else {
            self.head = node
            return
        }
        
        var current = start
        while (current.next != nil) {
            current = current.next!
        }
        current.next = node
    }
    
}

extension LinkedList: CustomStringConvertible {
    var description: String {
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


var ll = LinkedList<String>()
ll.append("A")
ll.append("D")
ll.append("B")

print(ll)
//: [Next](@next)
