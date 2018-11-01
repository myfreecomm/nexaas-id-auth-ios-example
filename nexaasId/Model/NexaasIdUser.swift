//
//  NexaasIdUser.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 30/10/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import CodableAlamofire
import Foundation

struct NexaasIdUser: Codable {
    
    let access_token: String
    let token_type: String
    let scope: String
    let expires_in: Int
    let api_token: String?
    
    
}
