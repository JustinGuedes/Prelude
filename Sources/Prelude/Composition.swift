//
//  Composition.swift
//  Prelude
//
//  Created by Justin Guedes on 2017/11/16.
//

// MARK: - Precedence Groups

precedencegroup FunctionCompositionPrecedence {
    associativity: right
    higherThan: AssignmentPrecedence
    lowerThan: TernaryPrecedence
}

// MARK: - Operators

infix operator >>> : FunctionCompositionPrecedence

infix operator >>>? : FunctionCompositionPrecedence

infix operator <<< : FunctionCompositionPrecedence

infix operator <<<? : FunctionCompositionPrecedence

// MARK: - Implementation

public func compose<A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> ((A) -> C) {
    return { g(f($0)) }
}

public func compose<A, B, C>(_ f: @escaping (A) -> B?, _ g: @escaping (B) -> C?) -> ((A) -> C?) {
    return { g <*> f($0) }
}

// MARK: - Operators Implementation

public func >>> <A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> ((A) -> C) {
    return compose(f, g)
}

public func >>>? <A, B, C>(_ f: @escaping (A) -> B?, _ g: @escaping (B) -> C?) -> ((A) -> C?) {
    return compose(f, g)
}

public func <<< <A, B, C>(_ f: @escaping (B) -> C, _ g: @escaping (A) -> B) -> ((A) -> C) {
    return compose(g, f)
}

public func <<<? <A, B, C>(_ f: @escaping (B) -> C?, _ g: @escaping (A) -> B?) -> ((A) -> C?) {
    return compose(g, f)
}
