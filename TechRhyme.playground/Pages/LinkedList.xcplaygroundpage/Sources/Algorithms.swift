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

    public func reverseRecursive() {
        
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

