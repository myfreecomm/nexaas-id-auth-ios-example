//
//  Singleton.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 05/11/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import Foundation

class Singleton {
    
    private static let ACCESS_TOKEN = "access_token"
    private static let USER = "user"
    
    
    static func accessToken() -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: ACCESS_TOKEN)
    }
    
    static func accessToken(accessToken: String) {
        let defaults = UserDefaults.standard
        defaults.set(accessToken, forKey: ACCESS_TOKEN)
    }
    
    static func clear() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: ACCESS_TOKEN)
        defaults.removeObject(forKey: USER)
        
    }
    
    static func user() -> User? {
        let defaults = UserDefaults.standard
        if let string = defaults.data(forKey: USER) {
            return try? JSONDecoder().decode(User.self, from: string)
        }
        return nil
    }
    
    
    static func user(user: User) {
        let defaults = UserDefaults.standard
        let encodedData = try? JSONEncoder().encode(user)
        defaults.set(encodedData, forKey: USER)
        defaults.synchronize()
    }
}

