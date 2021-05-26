//
//  Wrapper.swift
//  
//
//  Created by Oleh Riasnoi on 26.05.2021.
//

import Foundation

@propertyWrapper
public struct Keychain<Value> {
    
    public let key: String
    public let defaultValue: Value
    public var container = Keychainer(serviceName: "\(Keychainer.self)")

    public var wrappedValue: Value {
        get {
            return container.string(forKey: key) as? Value ?? defaultValue
        }
        set {
            set(newValue)
        }
    }
    
    private func set(_ value: Value) {
        if let value = value as? Int {
            container.set(value, forKey: key)
        } else if let value = value as? String {
            container.set(value, forKey: key)
        } else if let value = value as? NSCoding {
            container.set(value, forKey: key)
        } else if let value = value as? Data {
            container.set(value, forKey: key)
        } else if let value = value as? NSNumber {
            container.set(value, forKey: key)
        }
        fatalError("Unknown data type")
    }
    
    
}
