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
    public let container: Keychainer
    
    public var wrappedValue: Value {
        get {
            return container.string(forKey: key) as? Value ?? defaultValue
        }
        set {
            set(newValue)
        }
    }
    
    public init(key: String,
                defaultValue: Value,
                container: Keychainer = Keychainer(serviceName: "\(Keychainer.self)")) {
        self.key = key
        self.defaultValue = defaultValue
        self.container = container
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
