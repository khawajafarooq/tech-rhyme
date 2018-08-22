import Foundation

let openBrackets: [Character] = ["(", "{", "["]
let closedBrackets: [Character] = [")", "}", "]"]

// overloading ~= empowers your pattern mathing in switch
func ~=<T: Equatable>(pattern: [T], value: T) -> Bool {
    return pattern.contains(value)
}

func isExpressionBalanced(_ expression: String) -> Bool {
    
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
