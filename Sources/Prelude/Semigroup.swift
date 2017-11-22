//
//  Semigroup.swift
//  Prelude
//
//  Created by Justin Guedes on 2017/11/16.
//

// MARK: - Precedence Groups

precedencegroup SemigroupPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

// MARK: - Operators

infix operator <> : SemigroupPrecedence

// MARK: - Implementation

public protocol Semigroup {
    
    static func <> (lhs: Self, rhs: Self) -> Self
    
}

// MARK: - Standard Semigroups

extension Array: Semigroup {
    
    public static func <> (lhs: Array, rhs: Array) -> Array {
        return lhs + rhs
    }
    
}

extension String: Semigroup {
    
    public static func <> (lhs: String, rhs: String) -> String {
        return lhs + rhs
    }
    
}

// MARK: - Number Type Semigroups

extension Int: Semigroup {
    
    public static func <> (lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
}

extension Int8: Semigroup {
    
    public static func <> (lhs: Int8, rhs: Int8) -> Int8 {
        return lhs + rhs
    }
    
}

extension Int16: Semigroup {
    
    public static func <> (lhs: Int16, rhs: Int16) -> Int16 {
        return lhs + rhs
    }
    
}

extension Int32: Semigroup {
    
    public static func <> (lhs: Int32, rhs: Int32) -> Int32 {
        return lhs + rhs
    }
    
}

extension Int64: Semigroup {
    
    public static func <> (lhs: Int64, rhs: Int64) -> Int64 {
        return lhs + rhs
    }
    
}

extension UInt: Semigroup {
    
    public static func <> (lhs: UInt, rhs: UInt) -> UInt {
        return lhs + rhs
    }
    
}

extension UInt8: Semigroup {
    
    public static func <> (lhs: UInt8, rhs: UInt8) -> UInt8 {
        return lhs + rhs
    }
    
}

extension UInt16: Semigroup {
    
    public static func <> (lhs: UInt16, rhs: UInt16) -> UInt16 {
        return lhs + rhs
    }
    
}

extension UInt32: Semigroup {
    
    public static func <> (lhs: UInt32, rhs: UInt32) -> UInt32 {
        return lhs + rhs
    }
    
}

extension UInt64: Semigroup {
    
    public static func <> (lhs: UInt64, rhs: UInt64) -> UInt64 {
        return lhs + rhs
    }
    
}

extension Float: Semigroup {
    
    public static func <> (lhs: Float, rhs: Float) -> Float {
        return lhs + rhs
    }
    
}

extension Double: Semigroup {
    
    public static func <> (lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
}
