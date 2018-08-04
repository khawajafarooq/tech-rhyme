import Foundation

public class Node<T: Comparable> {
    public let value: T
    public var next: Node? = nil
    
    public init(value: T) {
        self.value = value
    }
}

extension Node: Equatable {
    static public func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value && lhs.next == rhs.next
    }
}

extension Node: Hashable {
    public var hashValue: Int {
        return Unmanaged.passUnretained(self).toOpaque().hashValue
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        
        return """
        [\(value)]
        """
    }
}
