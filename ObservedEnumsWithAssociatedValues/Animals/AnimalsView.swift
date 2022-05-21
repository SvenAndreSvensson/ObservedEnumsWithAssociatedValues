
import SwiftUI

struct AnimalsView: View {
    @ObservedObject var viewModel: AnimalsViewModel

    var body: some View {
        VStack(spacing: 24) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack( spacing: 16) {
                    ForEach(viewModel.animals) { animal in
                        Button {
                            viewModel.setActive(id: animal.id)
                        } label: {
                            createView(animal: animal)
                        }
                    }
                }
                .padding(.horizontal, 16)
            } // ScrollView

            if (viewModel.active != nil) {
                // THIS IS THE CLUE, remove the id and the textfield and it does not update the second time you select an animal
                createEditView(animal: viewModel.active!).id(viewModel.active!.id)
            }

            Text("Changing ObservedObject viewModels published active: Animal was not reflected in the view - not before the editor View id was set to the animal.id")
                .padding(.horizontal, 16)
        }
    }

    @ViewBuilder
    func createEditView(animal: Animal) -> some View {
        switch animal {
        case let .dog(dog):
            DogEditView(viewData: dog)
        case let .cat(cat):
            CatEditView(viewData: cat, actions: viewModel)
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

protocol CatEditViewActions {
    func updateCat(viewData: Cat, name: String)
}

struct CatEditView: View {
    var viewData: Cat
    var actions: CatEditViewActions?

    @State private var name: String

    init(viewData: Cat, actions: CatEditViewActions? ){
        self.viewData = viewData
        self.actions = actions
        _name = State(initialValue: viewData.name)
    }

    var body: some View {
        VStack(spacing: 0) {
            Text(viewData.name)
            TextField("", text: $name, prompt: Text("Write name"))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button {
                actions?.updateCat(viewData: viewData, name: name)
            } label: {
                Text("Update")
            }
        }
        .padding()
        .background(Color.blue.opacity(0.5))
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
}

struct DogEditView: View {
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
            .cat(.init(id: "4", name: "Tom", number: 3, state: .one)),
            .dog(.init(id: "1", name: "Millie", number: 1, state: .one)),
            .dog(.init(id: "2", name: "Ida", number: 2, state: .one)),
            .cat(.init(id: "3", name: "Tussi", number: 3, state: .three))

        ]))
    }
}
