//
//  Lens.swift
//  Prelude
//
//  Created by Justin Guedes on 2017/11/16.
//

public struct Lens<Whole, Part> {
    
    public let get: (Whole) -> Part
    public let mutatingSet: (inout Whole, Part) -> Void
    
    public init(get: @escaping (Whole) -> Part, mutatingSet: @escaping (inout Whole, Part) -> Void) {
        self.get = get
        self.mutatingSet = mutatingSet
    }
    
}

public extension Lens {
    
    var set: (Whole, Part) -> Whole {
        return { whole, part in
            var newWhole = whole
            self.mutatingSet(&newWhole, part)
            return newWhole
        }
    }
    
}

public extension Lens {
    
    init(_ keyPath: WritableKeyPath<Whole, Part>) {
        self.init(get: { $0[keyPath: keyPath] },
                  mutatingSet: { $0[keyPath: keyPath] = $1 })
    }
    
}

public extension Lens {
    
    func compose<Subpart>(_ rhs: Lens<Part, Subpart>) -> Lens<Whole, Subpart> {
        return Lens<Whole, Subpart>(get: self.get >>> rhs.get,
                                    mutatingSet: { whole, subpart in
                                        var part = self.get(whole)
                                        rhs.mutatingSet(&part, subpart)
                                        self.mutatingSet(&whole, part)
        })
    }
    
    func over(_ f: @escaping (Part) -> Part) -> ((Whole) -> Whole) {
        return { whole in
            var whole = whole
            let part = self.get(whole)
            self.mutatingSet(&whole, f(part))
            return whole
        }
    }
    
}

public extension Lens where Whole == Part {
    
    static var identity: Lens {
        return Lens(get: { $0 },
                    mutatingSet: { _, _ in })
    }
    
}

public func both<A, B, C>(_ lhs: Lens<A, B>, _ rhs: Lens<A, C>) -> Lens<A, (B, C)> {
    return Lens(get: { (lhs.get($0), rhs.get($0)) },
                mutatingSet: { whole, parts in
                    lhs.mutatingSet(&whole, parts.0)
                    rhs.mutatingSet(&whole, parts.1)
    })
}

public func >>> <A, B, C>(_ lhs: Lens<A, B>, _ rhs: Lens<B, C>) -> Lens<A, C> {
    return lhs.compose(rhs)
}

public func <<< <A, B, C>(_ lhs: Lens<B, C>, _ rhs: Lens<A, B>) -> Lens<A, C> {
    return rhs.compose(lhs)
}
