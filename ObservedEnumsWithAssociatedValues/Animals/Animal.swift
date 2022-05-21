import Foundation
import SwiftUI

enum Animal {
    case dog(Dog)
    case cat(Cat)

    enum State {
        case one
        case two
        case three
    }
}

extension Animal: Equatable {
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        lhs.id == rhs.id
    }
}

extension Animal: Identifiable {
    var id: String {
        switch self {
        case let .dog(dog):
            return dog.id
        case let .cat(cat):
            return cat.id
        }
    }
}

extension Animal {
    mutating func rename(with name: String) {
        switch self {
        case let .cat(cat):
            let _cat = Cat(id: cat.id, name: name, number: cat.number, state: cat.state)
            self = .cat(_cat)
        case let .dog(dog):
            let _dog = Dog(id: dog.id, name: name, number: dog.number, state: dog.state)
            self = .dog(_dog)
        }
    }
}

struct Dog: Identifiable {
    let id: String
    let name: String
    let number: Int
    let state: Animal.State
}

struct Cat: Identifiable {
    let id: String
    let name: String
    let number: Int
    let state: Animal.State
}
