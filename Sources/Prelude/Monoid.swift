//
//  Monoid.swift
//  Prelude
//
//  Created by Justin Guedes on 2017/11/16.
//

public protocol Monoid: Semigroup {
    
    static var empty: Self { get }
    
}

// MARK: - Standard Monoids

extension Array: Monoid {
    
    public static var empty: Array {
        return []
    }
    
}

extension String: Monoid {
    
    public static var empty: String {
        return ""
    }
    
}

// MARK: - Number Type Monoids

extension Int: Monoid {
    
    public static var empty: Int {
        return 0
    }
    
}

extension Int8: Monoid {
    
    public static var empty: Int8 {
        return 0
    }
    
}

extension Int16: Monoid {
    
    public static var empty: Int16 {
        return 0
    }
    
}

extension Int32: Monoid {
    
    public static var empty: Int32 {
        return 0
    }
    
}

extension Int64: Monoid {
    
    public static var empty: Int64 {
        return 0
    }
    
}

extension UInt: Monoid {
    
    public static var empty: UInt {
        return 0
    }
    
}

extension UInt8: Monoid {
    
    public static var empty: UInt8 {
        return 0
    }
    
}

extension UInt16: Monoid {
    
    public static var empty: UInt16 {
        return 0
    }
    
}

extension UInt32: Monoid {
    
    public static var empty: UInt32 {
        return 0
    }
    
}

extension UInt64: Monoid {
    
    public static var empty: UInt64 {
        return 0
    }
    
}

extension Float: Monoid {
    
    public static var empty: Float {
        return 0.0
    }
    
}

extension Double: Monoid {
    
    public static var empty: Double {
        return 0.0
    }
    
}
