import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Text("0")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 80))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.all, 16)
                CalculatorButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
