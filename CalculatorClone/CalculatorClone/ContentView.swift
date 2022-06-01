import SwiftUI

struct ContentView: View {
    @State var outputLabel = "0"
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Text("\(numberFormat(number: Int(outputLabel)!))")
                    .foregroundColor(.white)
                    .font(.system(size: 90))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .padding(.all, 16)
                CalculatorButton(outputLabel: $outputLabel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
