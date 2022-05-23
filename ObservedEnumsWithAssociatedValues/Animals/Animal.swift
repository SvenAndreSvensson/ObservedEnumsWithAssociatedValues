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
        switch lhs {
        case let .cat(lhsCat):
            guard case let .cat(rhsCat) = rhs else { return false }
            return lhsCat == rhsCat

        case let .dog(lhsDog):
            guard case let .dog(rhsDog) = rhs else { return false }
            return lhsDog == rhsDog
        }

        // lhs.id == rhs.id
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

//extension Animal {
//    mutating func rename(with name: String) {
//        switch self {
//        case let .cat(cat):
//            var _cat = cat // Cat(id: cat.id, name: name, number: cat.number, state: cat.state)
//            _cat.name = name
//            self = .cat(_cat)
//        case let .dog(dog):
//            let _dog = Dog(id: dog.id, name: name, number: dog.number, state: dog.state)
//            self = .dog(_dog)
//        }
//    }
//}

struct Dog: Identifiable {
    let id: String
    var name: String
    var number: Int
    var state: Animal.State
}

extension Dog: Equatable {
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        lhs.id == rhs.id
        && lhs.name == rhs.name && lhs.number == rhs.number && lhs.state == rhs.state
    }
}

struct Cat: Identifiable {
    let id: String
    var name: String
    var number: Int
    var state: Animal.State
}

extension Cat: Equatable {
    static func == (lhs: Cat, rhs: Cat) -> Bool {
        lhs.id == rhs.id
        && lhs.name == rhs.name && lhs.number == rhs.number && lhs.state == rhs.state
    }
}
