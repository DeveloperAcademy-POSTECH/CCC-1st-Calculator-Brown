import SwiftUI

struct ContentView: View {
    @State var displayValue = "0"
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Text("\(displayValue)")
                    .foregroundColor(.white)
                    .font(.system(size: 58))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.all, 16)
                CalculatorButton(displayValue: $displayValue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
