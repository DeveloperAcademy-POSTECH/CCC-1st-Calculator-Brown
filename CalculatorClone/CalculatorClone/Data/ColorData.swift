import SwiftUI

extension Color {
    static let numColor = Color(hex: "#333333")
    static let operatorColor = Color(hex: "#f1a33c")
    static let subFunctionColor = Color(hex: "#a5a5a5")

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
