//
//  Monoid.swift
//  Prelude
//
//  Created by Justin Guedes on 2017/11/16.
//

public protocol Monoid: Semigroup {
    
    static var empty: Self { get }
    
}
