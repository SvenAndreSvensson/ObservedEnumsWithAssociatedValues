//
//  ContentView.swift
//  ObservedEnumsWithAssociatedValues
//
//  Created by Sven Svensson on 21/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AnimalsView(viewModel: .init(animals: [
            .cat(.init(id: "4", name: "Tom", number: 3, state: .one)),
            .dog(.init(id: "1", name: "Millie", number: 1, state: .one)),
            .dog(.init(id: "2", name: "Ida", number: 2, state: .one)),
            .cat(.init(id: "3", name: "Tussi", number: 3, state: .three))

        ]))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
