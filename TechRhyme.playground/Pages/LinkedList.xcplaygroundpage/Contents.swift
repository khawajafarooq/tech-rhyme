//: [Previous](@previous)

import Foundation

class Node<T: Comparable> {
    let data: T
    var next: Node? = nil
    
    init(data: T) {
        self.data = data
    }
}

struct LinkedList<T: Comparable> {
    
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
        var current = head!
        while (current.next != nil) {
            current = current.next!
        }
        current.next = node
    }
    
    mutating func prepend(_ data: T) {
        let newHead = Node<T>(data: data)
        newHead.next = head
        head = newHead
    }
    
    mutating func delete(with data: T) {
        
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

ll.prepend("Í")
ll.delete(with: "A")
ll.delete(with: "Í")
print(ll)
//: [Next](@next)
