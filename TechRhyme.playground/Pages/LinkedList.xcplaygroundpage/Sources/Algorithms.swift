import Foundation


extension LinkedList {
    
    mutating public func reverse() {
        
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
        return false
    }

}

