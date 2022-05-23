
import SwiftUI

class AnimalsViewModel: ObservableObject {
    @Published var animals: [Animal]
    @Published var active: Animal?

    init(animals:[Animal] = []) {
        self.animals = animals
    }

    func setActive(id: String) {
        active = animals.first(where: { $0.id == id })
    }
}

extension AnimalsViewModel: CatEditViewActions {
    func updateCat(viewData: Cat, name: String) {
        guard
            let catModuleIndex = animals.firstIndex(where: { $0.id == viewData.id }),
            case var .cat(cat) = animals[catModuleIndex] else {
                assertionFailure("❌ expected cat to exist")
                return
        }

        cat.name = name
        animals[catModuleIndex] = .cat(cat)
    }
}
