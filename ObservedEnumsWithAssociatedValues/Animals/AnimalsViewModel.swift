
import SwiftUI

class AnimalsViewModel: ObservableObject {
    @Published var animals: [Animal]
    @Published var editing: Animal?

    init(animals:[Animal] = []) {
        self.animals = animals
    }

    func setActive(id: String) {
        guard let animal = animals.first(where: { $0.id == id }) else {
            fatalError("wtf...")
        }

        editing = animal
    }
}

extension AnimalsViewModel: EditViewActions {
    func update(animal: Animal) {
        guard let index = animals.firstIndex(where: { $0.id == animal.id }) else {
            fatalError("wtf..")
        }

        animals[index] = animal
        editing = nil
    }
}
