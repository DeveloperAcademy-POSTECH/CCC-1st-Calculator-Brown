import SwiftUI

enum CalculatorButtonContent: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case plus = "plus"
    case minus = "minus"
    case divide = "divide"
    case multiply = "multiply"
    case percent = "percent"
    case equal = "equal"
    case clear = "clear"
    case dot = "dot"
    case negative = "negative"
    
    var buttonColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return .subFunctionColor
        case .divide, .multiply, .minus, .plus, .equal:
            return .operatorColor
        default:
            return .numColor
        } 
    }
}

enum Operator {
    case divide, multiply, minus, plus, equal, none
}
