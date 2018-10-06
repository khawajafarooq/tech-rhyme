//: [Previous](@previous)

import Foundation

// Tests
var ll = LinkedList<String>()
ll.append("A")
ll.append("D")
ll.append("B")
ll.append("G")
ll.append("W")

//ll.append(data: "E", at: 1)
//ll.append(data: "O", at: 0)
//ll.delete(with: "E")
//ll.delete(with: "O")
print(ll)

let node = ll.middleNode()
print("\(node!)")

ll.reverse()
print(ll)


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var list1 = l1
    var list2 = l2
    let dummy: ListNode? = nil
    var result = dummy
    var carry = 0
    
    while (list1 != nil || list2 != nil) {
        
        let val1 = list1 != nil ? list1?.val : 0
        let val2 = list2 != nil ? list2?.val : 0
            
        let sum = val1! + val2! + carry
        carry = sum / 10
        let nodeValue = ListNode(sum % 10)
        
        result?.next = nodeValue
        result = result?.next
        if list1 != nil { list1 = list1?.next }
        if list2 != nil { list2 = list2?.next }
    }
    
    if carry > 0 {
        result?.next = ListNode(carry)
    }
    
    return dummy?.next
}


