//
//  UserDefaultManager.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//

import Foundation

final class UserDefaultManager {
    
    static func save(key: String, data: Any) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    static func getObject(key: String) -> Any? {
        UserDefaults.standard.object(forKey: key)
    }
}
