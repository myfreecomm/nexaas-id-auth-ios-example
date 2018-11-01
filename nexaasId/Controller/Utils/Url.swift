//
//  Url.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 29/10/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import Foundation

class Url {
    

    
    static let SANDBOX_URL = "https://sandbox.id.nexaas.com/"
    static let PROD_URL = "https://id.nexaas.com/"
    static let CLIENT_ID = "5USYUVZHRFD7ZLXZA3BNYGW6HY"
    static let CLIENT_SECRET = "ZFZAP5WR7VD6XJDVS7JKMYVZ7U"


    static let GRANT_TYPE_CREATE = "client_credentials"
    static let GRANT_TYPE_CREDENTIALS = "authorization_code"
    
    
    static func signin() -> String {
        return SANDBOX_URL + "oauth/token"
    }
    
    static func authorize() -> String {
        return SANDBOX_URL + "oauth/authorize"
    }
  
    static func getUser() -> String {
        return SANDBOX_URL + "api/v1/profile"
    }
    

}
