import Foundation

let openBrackets: [Character] = ["(", "{", "["]
let closedBrackets: [Character] = [")", "}", "]"]

// overloading ~= empowers your pattern mathing in switch
func ~=<T: Equatable>(pattern: [T], value: T) -> Bool {
    return pattern.contains(value)
}

public func isExpressionBalanced(_ expression: String) -> Bool {
    
    guard !expression.isEmpty else { return false }
    
    var stack = [Character]()
    
    for char in expression {
        
        switch char {
        case openBrackets: stack.append(char)
        case closedBrackets:
            guard !stack.isEmpty else { return false }
            
            if (stack.last! == "(" && char == ")") ||
                (stack.last! == "{" && char == "}") ||
                (stack.last! == "[" && char == "]") {
                stack.removeLast()
            }
        default: break
        }
    }
    
    return stack.isEmpty
}

var Operations: [String: (Double, Double) -> Double] = [
    "*": { $0 * $1 },
    "+": { $0 + $1 },
    "-": { $1 - $0 },
    "/": { $1 / $0 }
]

let Operators = ["+", "-", "*", "/"]

public func postfix(_ expression: String) -> Double {
    
    guard !expression.isEmpty else { return 0.0 }
    let exp = expression.components(separatedBy: " ")
    var stack = [Double]()
    
    for char in exp {
        
        switch (Double(char), Operations[char]) {
        case (.some(let number), _): stack.append(number)
        case (_, .some(let op)):
            let lastNumber = stack.removeLast()
            stack.append(op(stack.last!, lastNumber))
            
        default:
            print("Not an operand or operations")
        }
    }
    
    return stack.last!
}

public func prefix(_ expression: String) -> Double {
    
    guard !expression.isEmpty else { return 0.0 }
    let exp = expression.components(separatedBy: " ")
    var stack = [Double]()
    var lastOp = ""
    for char in exp {
        
        if let number = Double(char) {
            
            if !stack.isEmpty {
                let last = stack.removeLast()
                if let op = Operations[lastOp] {
                    stack.append(op(last, number))
                }
            } else {
                stack.append(number)
            }
        } else {
            lastOp = char
        }
    }
    
    return stack.last!
}

// 2 * 3 + 4
// * 2 3 + 4
// 2 3 * 4 +
