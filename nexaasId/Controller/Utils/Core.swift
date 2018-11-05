//
//  Core.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 30/10/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import Alamofire
import CodableAlamofire
import Foundation

class Core {
    
  
    static func getUser(accessToken: String,completion: @escaping (User?, _ error: Int?) -> ()) {
        let url = Url.getUser()
        let headers = Headers.authorization(accessToken: accessToken)
        
        Alamofire.request(url, method: .get, headers: headers).responseDecodableObject(decoder: JSONDecoder()) { (response: DataResponse<User>) in
            let repo = response.result.value
            let error = response.response?.statusCode
         
            completion(repo, error)
        }
    }
    
    static func signOut(accessToken: String,completion: @escaping (_ error: Int?) -> ()) {
        let url = Url.signOut()
        let headers = Headers.authorization(accessToken: accessToken)
        
        Alamofire.request(url, method: .get, headers: headers).responseJSON { response in
            
            let error = response.response?.statusCode
        
            completion(error)
        }
    }

}
