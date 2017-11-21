//
//  Prism.swift
//  Prelude
//
//  Created by Justin Guedes on 2017/11/16.
//

public struct Prism<Whole, Part> {
    
    public let tryGetFrom: (Whole) -> Part?
    public let createFrom: (Part) -> Whole
    
    public init(tryGetFrom: @escaping (Whole) -> Part?, createFrom: @escaping (Part) -> Whole) {
        self.tryGetFrom = tryGetFrom
        self.createFrom = createFrom
    }
    
}

public extension Prism {
    
    func compose<Subpart>(_ rhs: Prism<Part, Subpart>) -> Prism<Whole, Subpart> {
        return Prism<Whole, Subpart>(tryGetFrom: self.tryGetFrom >>>? rhs.tryGetFrom,
                                     createFrom: self.createFrom <<< rhs.createFrom)
    }
    
}

public extension Prism where Whole == Part {
    
    static var identity: Prism {
        return Prism(tryGetFrom: { $0 },
                     createFrom: { $0 })
    }
    
}

public func >>> <A, B, C>(_ lhs: Prism<A, B>, _ rhs: Prism<B, C>) -> Prism<A, C> {
    return lhs.compose(rhs)
}

public func <<< <A, B, C>(_ lhs: Prism<B, C>, _ rhs: Prism<A, B>) -> Prism<A, C> {
    return rhs.compose(lhs)
}
