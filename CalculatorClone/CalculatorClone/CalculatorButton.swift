import SwiftUI

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
                value = Int(displayValue.components(separatedBy: ",").joined()) ?? 0
            } else if button == .multiply {
                currentOperator = .multiply
                value = Int(displayValue.components(separatedBy: ",").joined()) ?? 0
            } else if button == .minus {
                currentOperator = .minus
                value = Int(displayValue.components(separatedBy: ",").joined()) ?? 0
            } else if button == .plus {
                currentOperator = .plus
                value = Int(displayValue.components(separatedBy: ",").joined()) ?? 0
            } else if button == .equal {
                currentOperator = .equal
                value = Int(displayValue.components(separatedBy: ",").joined()) ?? 0
            }
        case .clear:
            if currentOperator == .none {
                displayValue = "0"
                value = 0
            } else {
                currentOperator = .none
                displayValue = "0"
            }
        case .negative:
            value = Int(displayValue.components(separatedBy: ",").joined()) ?? 0
            value *= -1
            displayValue = numberFormat(number: value)
        case .percent:
            value /= 100
        default:
            let num = button.rawValue
            if displayValue == "0" {
                displayValue = num
            } else {
                if displayValue.components(separatedBy: ",").joined().count != 9 {
                    displayValue = displayValue.components(separatedBy: ",").joined()
                    displayValue += num
                    displayValue = numberFormat(number: Int(displayValue)!)
                    print(value)
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
