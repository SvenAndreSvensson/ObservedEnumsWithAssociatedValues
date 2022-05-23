import SwiftUI

struct ContentView: View {
    var body: some View {
        AnimalsView(viewModel: .init(animals: [
            .cat(.init(id: "1", name: "Lilo", foobar: 0)),
            .dog(.init(id: "2", name: "Marko", foobar: 1)),
            .cat(.init(id: "3", name: "Pepsi", foobar: 2))
        ]))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
