//
//  UserDefaultsHelper.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 1/6/25.
//
import UIKit

final class UserDefaultsHelper {
    enum UserDetailKeys: String {
        case token
        case username
        case defaultPageSize
    }
   
    private init(){}
    
    // String Handeling
    static func set(_ value: String?, forKey key: UserDetailKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func get(forKey key: UserDetailKeys) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    // Int Handling
    static func set(_ value: Int?, forKey key: UserDetailKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func get(forKey key: UserDetailKeys) -> Int? {
        UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    // Double Handeling
    static func set(_ value: Double?, forKey key: UserDetailKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func get(forKey key: UserDetailKeys) -> Double? {
        UserDefaults.standard.double(forKey: key.rawValue)
    }
    
    // Dictionary Handeling
    static func set<Key: Hashable, Value: Any>(_ value: [Key: Value], forKey key: UserDetailKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func get<Key: Hashable, Value: Any>(forKey key: UserDetailKeys) -> [Key: Value]? {
        UserDefaults.standard.dictionary(forKey: key.rawValue) as? [Key: Value]
    }
    
    
    
    
}
