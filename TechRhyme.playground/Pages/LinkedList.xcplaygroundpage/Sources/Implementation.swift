import Foundation

public class Node<T: Comparable> {
    public let data: T
    public var next: Node? = nil
    
    public init(data: T) {
        self.data = data
    }
}

extension Node: Equatable {
    static public func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.data == rhs.data && lhs.next == rhs.next
    }
}

extension Node: Hashable {
    public var hashValue: Int {
        return Unmanaged.passUnretained(self).toOpaque().hashValue
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "🔘: \(data)"
    }
}

public class LinkedList<T: Comparable> {
    
    public var head: Node<T>?
    public private(set) var count: Int = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    public init() {}
    
    public func append(_ data: T) {
        append(Node(data: data))
    }
    
    public func append(data: T, at position: Int) {
        
        guard position >= 0 else { return }
        
        if position == 0 {
            prepend(data)
        } else {

            guard var node = head else { return }

            var counter = 0
            while counter < position-1 && node.next != nil {
                node = node.next!
                counter += 1
            }
            
            // adding node to the right position
            let newNode = Node(data: data)
            newNode.next = node.next
            node.next = newNode
            count += 1
        }
    }
    
    public func append(_ node: Node<T>) {
        guard !isEmpty else {
            self.head = Node(data: node.data)
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
    
    public func prepend(_ data: T) {
        let newHead = Node(data: data)
        newHead.next = head
        head = newHead
        count += 1
    }
    
    public func delete(with data: T) {
        
        guard var node = head else { return }
        guard node.data != data else {
            head = node.next
            count -= 1
            return
        }
        
        while let next = node.next {
            if next.data == data {
                node.next = node.next?.next
                count -= 1
                return
            }
            node = next
        }
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard var current = head else {
            return """
            LINKED LIST EMPTY 🚫
            """
        }
        
        var result = "\(current.data)->"
        
        while current.next != nil {
            current = current.next!
            result += "\(current.data)->"
        }
        result += "nil\n\(count)"
        return result
    }
}
