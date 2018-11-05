//
//  Params.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 29/10/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import Foundation
import Alamofire

class Params {
    
    static func credentials() -> [String: Any] {
        return ["grant_type": Url.GRANT_TYPE_CREATE, "client_id": Url.CLIENT_ID, "client_secret": Url.CLIENT_SECRET]
    }
    
    static func signIn(username: String, password: String) -> [String: Any] {
        return ["username": username, "password": password, "grant_type": Url.GRANT_TYPE_CREDENTIALS, "client_id": Url.CLIENT_ID, "client_secret": Url.CLIENT_SECRET,"Content-Type": "application/json"]
    }
    
}
