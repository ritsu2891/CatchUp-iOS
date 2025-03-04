import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, rpaka!")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
            Text("How are you")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
