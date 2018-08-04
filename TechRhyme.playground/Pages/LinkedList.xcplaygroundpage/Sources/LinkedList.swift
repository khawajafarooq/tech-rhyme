import Foundation


protocol BaseLinkedList {
    associatedtype DataType: Comparable
    var head: Node<DataType>? { get set }
    var count: Int { get set }
    var isEmpty: Bool { get }
    func append(_ value: DataType)
    func delete(_ value: DataType)
}

public class LinkedList<T: Comparable> {
    
    public var head: Node<T>?
    public private(set) var count: Int = 0
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public init() {}
    
    public func append(_ value: T) {
        append(Node(value: value))
    }
    
    public func delete(_ value: T) {
        
        guard var node = head else { return }
        guard node.value != value else {
            head = node.next
            count -= 1
            return
        }
        
        while let next = node.next {
            if next.value == value {
                node.next = node.next?.next
                count -= 1
                return
            }
            node = next
        }
    }
    
    public func append(value: T, at position: Int) {
        
        guard position >= 0 else { return }
        
        if position == 0 {
            prepend(value)
        } else {

            guard var node = head else { return }

            var counter = 0
            while counter < position-1 && node.next != nil {
                node = node.next!
                counter += 1
            }
            
            // adding node to the right position
            let newNode = Node(value: value)
            newNode.next = node.next
            node.next = newNode
            count += 1
        }
    }
    
    public func append(_ node: Node<T>) {
        guard !isEmpty else {
            self.head = Node(value: node.value)
            count += 1
            return
        }
        guard var current = head else { return }
        while let next = current.next {
            current = next
        }
        current.next = node
        count += 1
    }
    
    public func prepend(_ value: T) {
        let newHead = Node(value: value)
        newHead.next = head
        head = newHead
        count += 1
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard var current = head else {
            return """
            LINKED LIST IS EMPTY 🚫
            """
        }
        
        var result = "\(current.value)->"
        
        while current.next != nil {
            current = current.next!
            result += "\(current.value)->"
        }
        result += "nil\n\(count)"
        return result
    }
}
