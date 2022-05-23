
import SwiftUI

struct AnimalsView: View {
    @StateObject var viewModel: AnimalsViewModel

    var body: some View {
        VStack(spacing: 24) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack( spacing: 16) {
                    ForEach(viewModel.animals) { animal in
                        Button {
                            viewModel.setActive(id: animal.id)
                        } label: {
                            switch animal {
                            case let .dog(dog):
                                DogView(viewData: dog)

                            case let .cat(cat):
                                CatView(viewData: cat)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }

            if let animal = viewModel.editing {
                EditView(animal: animal, actions: viewModel)
            }
        }
    }

    @ViewBuilder
    func createView(animal: Animal) -> some View {
        switch animal {
        case let .dog(dog):
            DogView(viewData: dog)
        case let .cat(cat):
            CatView(viewData: cat)
        }
    }
}

protocol EditViewActions {
    func update(animal: Animal)
}

struct EditView: View {
    var animal: Animal
    var actions: EditViewActions?

    @State private var name: String = ""

    init(animal: Animal, actions: EditViewActions? ){
        self.animal = animal
        self.actions = actions
    }

    var body: some View {
        VStack(spacing: 0) {
            TextField("", text: $name, prompt: Text("Write name"))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button {
                var copy = animal
                copy.rename(with: name)
                actions?.update(animal: copy)
            } label: {
                Text("Update")
            }
        }
        .padding()
        .background(Color.blue.opacity(0.5))
        .cornerRadius(8)
        .padding(.horizontal, 16)
        .onAppear(perform: {
            switch animal {
            case .dog(let dog):
                name = dog.name

            case .cat(let cat):
                name = cat.name
            }
        })
    }
}

struct CatView: View {
    var viewData: Cat

    var body: some View {
        VStack(spacing: 0) {
            Text(viewData.name)
        }
        .padding()
        .background(Color.blue.opacity(0.5))
        .cornerRadius(8)
    }
}

struct DogView: View {
    var viewData: Dog

    var body: some View {
        VStack(spacing: 0) {
            Text(viewData.name)
        }
        .padding()
        .background(Color.red.opacity(0.5))
        .cornerRadius(8)
    }
}

struct AnimalsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsView(viewModel: .init(animals: [
            .cat(.init(id: "1", name: "Lilo", foobar: 0)),
            .dog(.init(id: "2", name: "Marko", foobar: 1)),
            .cat(.init(id: "3", name: "Pepsi", foobar: 2))
        ]))
    }
}
