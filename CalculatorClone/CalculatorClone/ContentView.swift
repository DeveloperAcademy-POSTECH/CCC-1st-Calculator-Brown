import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("0")
                .font(.system(size: 46))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.all, 16)
            CalculatorButton()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
