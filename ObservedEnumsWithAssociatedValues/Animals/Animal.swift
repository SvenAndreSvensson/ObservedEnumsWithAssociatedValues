import Foundation
import SwiftUI

enum Animal {
    case dog(Dog)
    case cat(Cat)
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

extension Animal: Equatable {
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        lhs.id == rhs.id
    }
}

extension Animal {
    mutating func rename(with name: String) {
        switch self {
        case var .cat(cat):
            cat.name = name
            self = .cat(cat)

        case var .dog(dog):
            dog.name = name
            self = .dog(dog)
        }
    }
}

struct Dog: Identifiable {
    let id: String
    var name: String
    var foobar: Int
}

struct Cat: Identifiable {
    let id: String
    var name: String
    var foobar: Int
}
