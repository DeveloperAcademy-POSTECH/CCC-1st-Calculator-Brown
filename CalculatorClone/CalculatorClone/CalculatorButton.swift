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

struct CalculatorButton: View {
    @State var currentOperator: Operator = .none
    @State var value = 0
    @Binding var displayValue: String
    
    let buttons: [[CalculatorButtonContent]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal]
    ]
    
    var body: some View {
        VStack {
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { content in
                        Button(action: {
                            tappedButton(button: content)
                        }, label: {
                            Image(content.rawValue)
                                .resizable()
                                .frame(width: self.buttonWidth(content: content), height: self.buttonHeight())
                        })
                    }
                }
                .padding(.bottom, 6)
            }
        }
    }
    
    func buttonWidth(content: CalculatorButtonContent) -> CGFloat {
        if content == .zero {
            return (((UIScreen.main.bounds.width - (16*4)) / 4) * 2) + 12
        }
        return ((UIScreen.main.bounds.width - (16*4)) / 4)
    }
    
    func buttonHeight() -> CGFloat {
        return ((UIScreen.main.bounds.width - (16*4)) / 4)
    }
    
    func tappedButton(button: CalculatorButtonContent) {
        switch button {
        case .divide, .multiply, .minus, .plus, .equal:
            if button == .divide {
                currentOperator = .divide
                value = Int(displayValue) ?? 0
                print(value)
                print(type(of: value))
            } else if button == .multiply {
                currentOperator = .multiply
                value = Int(displayValue) ?? 0
                print(value)
            } else if button == .minus {
                currentOperator = .minus
                value = Int(displayValue) ?? 0
                print(value)
            } else if button == .plus {
                currentOperator = .plus
                value = Int(displayValue) ?? 0
                print(value)
            } else if button == .equal {
                currentOperator = .equal
                value = Int(displayValue) ?? 0
                print(value)
            }
        case .clear:
            displayValue = "0"
            currentOperator = .none
            value = Int(displayValue) ?? 0
            print(value)
        case .negative:
            value *= -1
            print(value)
        case .percent:
            break // value*0.01
        default:
            let num = button.rawValue
            if displayValue == "0" {
                displayValue = num
            } else {
                if displayValue.count != 9 {
                    displayValue = "\(displayValue)\(num)"
                }
                
            }
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(displayValue: .constant("1"))
    }
}
