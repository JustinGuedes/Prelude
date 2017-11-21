//
//  Semigroup.swift
//  Prelude
//
//  Created by Justin Guedes on 2017/11/16.
//

// MARK: - Precedence Groups

precedencegroup SemigroupPrecedence {
    associativity: left
}

// MARK: - Operators

infix operator <> : SemigroupPrecedence

// MARK: - Implementation

public protocol Semigroup {
    
    static func <> (lhs: Self, rhs: Self) -> Self
    
}
