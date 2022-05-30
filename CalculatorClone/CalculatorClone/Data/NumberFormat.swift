import SwiftUI

func numberFormat(number: Int) -> String {
    let numberFormat = NumberFormatter()
    numberFormat.numberStyle = .decimal
    
    return numberFormat.string(from: NSNumber(value: number))!
}
