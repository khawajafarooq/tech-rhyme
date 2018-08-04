import Foundation


extension LinkedList {
    
    public func reverse() {
        
        guard !isEmpty else { return }
        
        var current = head!
        var prev: Node<T>? = nil
        while head?.next != nil {
            head = current.next!
            current.next = prev
            prev = current
            current = head!
        }
        
        current.next = prev
        prev = current
        current = head!
    }

    public func middleNode() -> Node<T>? {
        
        guard var node = head else { return nil }
        var secNext = node.next
        while secNext != nil {
            
            node = node.next!
            secNext = secNext?.next?.next
        }
        
        return node
    }

    public func isLoop() -> Bool {
        
        guard var node = head else { return false }

        var hashMap = [Node<T>: Int]()
        hashMap[node] = 1
        while let next = node.next {
            
            if hashMap.keys.contains(next) {
                return true
            }
            hashMap[next] = 1
            node = next
        }
        
        return false
    }

}

