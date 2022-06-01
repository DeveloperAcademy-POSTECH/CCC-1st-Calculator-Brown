import SwiftUI

struct CalculatorButton: View {
    @State var currentOperator: Operator = .none
    @State var value = 0
    @State var result = ""
    @State var firstOperand = ""
    @State var secondOperand = ""
    @State var displayValue = ""
    @Binding var outputLabel: String
    
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
                            tapButton(button: content)
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
    
    func tapButton(button: CalculatorButtonContent) {
        switch button {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            tapNumberButton(button: button)
        case .plus:
            tapPlusButton()
        case .minus:
            tapMinusButton()
        case .divide:
            tapDivideButton()
        case .multiply:
            tapMultiplyButton()
        case .percent:
            tapPercentButton()
        case .equal:
            tapEqualButton()
        case .clear:
            tapClearButton()
        case .dot:
            tapDotButton()
        case .negative:
            tapNegativeButton()
        }
    }

    func tapNumberButton(button: CalculatorButtonContent) {
        var numberValue = button.rawValue
        if displayValue.count < 9 {
            if displayValue == "-0" {
                displayValue = displayValue.components(separatedBy: "0").joined()
                displayValue += numberValue
                outputLabel = displayValue
            } else {
                displayValue += numberValue
                outputLabel = displayValue
            }
        }
    }

    func tapClearButton() {
        displayValue = ""
        firstOperand = ""
        secondOperand = ""
        result = ""
        currentOperator = .none
        outputLabel = "0"
    }

    func tapNegativeButton() {
        if outputLabel == "0" {
            displayValue = "-0"
            outputLabel = displayValue
        } else if !outputLabel.contains("-") {
            displayValue = "-\(displayValue)"
            outputLabel = displayValue
        } else if outputLabel.contains("-") {
            displayValue = displayValue.components(separatedBy: "-").joined()
            outputLabel = displayValue
        }
    }

    func tapPercentButton() {
        guard var displayValue = Double(displayValue) else { return }
        guard var outputLabel = Double(outputLabel) else { return }
        
        displayValue *= 0.01
        outputLabel = displayValue
        self.displayValue = String(displayValue)
        self.outputLabel = String(outputLabel)
    }

    func tapDivideButton() {
        operation(.divide)
    }

    func tapMultiplyButton() {
        operation(.multiply)
    }

    func tapMinusButton() {
        operation(.minus)
    }

    func tapPlusButton() {
        operation(.plus)
    }

    func tapEqualButton() {
        operation(currentOperator)
    }

    func tapDotButton() {
        if displayValue.count < 9, !displayValue.contains(".") {
            displayValue += displayValue.isEmpty ? "0." : "."
            outputLabel = displayValue
        }
    }

    func operation(_ operation: Operator) {
        if self.currentOperator != .none {
            if !displayValue.isEmpty {
                secondOperand = displayValue
                displayValue = ""
                
                guard let firstOperand = Double(firstOperand) else { return }
                guard let secondOperand = Double(secondOperand) else { return }
                
                switch currentOperator {
                case .divide:
                    if secondOperand == 0.0 {
                        result = "Error"
                    } else {
                        result = "\(firstOperand / secondOperand)"
                    }
                case .multiply:
                    result = "\(firstOperand * secondOperand)"
                case .minus:
                    result = "\(firstOperand - secondOperand)"
                case .plus:
                    result = "\(firstOperand + secondOperand)"
                default:
                    break
                }
                
                if let result = Double(result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                outputLabel = result
            }
            currentOperator = operation
        } else {
            firstOperand = displayValue
            currentOperator = operation
            displayValue = ""
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(outputLabel: .constant("1"))
    }
}
