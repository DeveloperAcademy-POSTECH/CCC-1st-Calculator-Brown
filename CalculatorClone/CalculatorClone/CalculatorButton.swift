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
    case plus = "+"
    case minus = "-"
    case divide = "/"
    case multiply = "x"
    case percent = "%"
    case equal = "="
    case clear = "AC"
    case dot = "."
    case negative = "+/-"
    
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

struct CalculatorButton: View {
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
                HStack {
                    ForEach(row, id: \.self) { content in
                        Button(action: {
                            
                        }, label: {
                            Text(content.rawValue)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(content: content), height: self.buttonHeight())
                                .background(content.buttonColor)
                                .foregroundColor(.white)
                                .cornerRadius(100)
                        })
                    }
                }
            }
        }
    }
    
    func buttonWidth(content: CalculatorButtonContent) -> CGFloat {
        if content == .zero {
            return ((UIScreen.main.bounds.width - (12*4)) / 4) * 2
        }
        return ((UIScreen.main.bounds.width - (12*4)) / 4)
    }
    
    func buttonHeight() -> CGFloat {
        return ((UIScreen.main.bounds.width - (12*4)) / 4)
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
