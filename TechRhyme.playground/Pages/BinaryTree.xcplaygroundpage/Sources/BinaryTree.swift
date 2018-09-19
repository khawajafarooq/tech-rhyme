import Foundation

public class TreeNode<T: Comparable> {
    var left: TreeNode?
    var right: TreeNode?
    let data: T
    
    init (left: TreeNode? = nil, right: TreeNode? = nil, data: T) {
        self.left = left
        self.right = right
        self.data = data
    }
}

public class BinaryTree<T: Comparable> {
//    public typealias Node = TreeNode<T>
    
    public var root: TreeNode<T>? = nil
    
    public init() { }
    
    public func insert(_ value: T) {
        // if tree is empty
        let node = TreeNode(data: value)
        if root == nil {
            root = node
            return
        }
        
        var traverser = root
        var prev = root
        while traverser != nil {
            prev = traverser
            traverser = value < traverser!.data ? traverser?.left : traverser?.right
        }
        
        if value < prev!.data {
            prev?.left = node
        } else {
            prev?.right = node
        }
    }
    
    public func delete() {
        
    }
    
    public func search(_ value: T) -> Bool {
        var node = root
        
        while node != nil {
            
            if value < node!.data {
                node = node?.left
            } else if value > node!.data {
                node = node?.right
            } else {
                return true
            }
        }
        
        return false
    }
    
    // MARK: - Traversals
    public func preOrder(_ node: TreeNode<T>?) {
        
        guard let current = node else { return }
        
        print(current.data)
        preOrder(current.left)
        preOrder(current.right)
    }
    
    public func inOrder(_ node: TreeNode<T>?) {
        guard let current = node else { return }
        
        inOrder(current.left)
        print(current.data)
        inOrder(current.right)
    }
    
    public func postOrder(_ node: TreeNode<T>?) {
        guard let current = node else { return }
        
        postOrder(current.left)
        postOrder(current.right)
        print(current.data)
    }
}
