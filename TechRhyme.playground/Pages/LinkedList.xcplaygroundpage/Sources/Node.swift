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
