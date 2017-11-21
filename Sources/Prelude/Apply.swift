//
//  Apply.swift
//  Prelude
//
//  Created by Justin Guedes on 2017/11/16.
//

// MARK: - Precedence Groups

precedencegroup ApplyPrecedence {
    associativity: right
    higherThan: FunctionCompositionPrecedence
}

// MARK: - Operators

infix operator <*>: ApplyPrecedence

// MARK: - Implementation

public func apply<A, B>(_ f: (A) -> B, _ x: A) -> B {
    return f(x)
}

public func apply<A, B>(_ f: (A) -> B?, _ x: A) -> B? {
    return f(x)
}

public func apply<A, B>(_ f: (A) -> B, _ x: A?) -> B? {
    return x.flatMap(f)
}

public func apply<A, B>(_ f: (A) -> B?, _ x: A?) -> B? {
    return x.flatMap(f)
}

// MARK: - Operators Implementation

public func <*> <A, B>(_ f: (A) -> B, _ x: A) -> B {
    return apply(f, x)
}

public func <*> <A, B>(_ f: (A) -> B?, _ x: A) -> B? {
    return apply(f, x)
}

public func <*> <A, B>(_ f: (A) -> B, _ x: A?) -> B? {
    return apply(f, x)
}

public func <*> <A, B>(_ f: (A) -> B?, _ x: A?) -> B? {
    return apply(f, x)
}
