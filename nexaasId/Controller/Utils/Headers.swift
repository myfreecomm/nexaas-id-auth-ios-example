//
//  Headers.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 29/10/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import Alamofire
import Foundation

public class Headers {
    
    public static func authorization(accessToken: String) -> HTTPHeaders {
          return ["Authorization": "Bearer \(accessToken)", "Content-Type": "application/json"]
    }
}
