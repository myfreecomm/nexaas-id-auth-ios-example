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
    
    static func credentials(completion: @escaping (NexaasIdUser?) -> ()) {
        let url = Url.signin()
        let parameters: Parameters = Params.credentials()
     
        Alamofire.request(url, method: .post, parameters: parameters).responseDecodableObject(decoder: JSONDecoder()) { (response: DataResponse<NexaasIdUser>) in
            let repo = response.result.value
        
            completion(repo)
        }
    }
    
    static func authorize(completion: @escaping (NexaasIdUser?) -> ()) {
        let url = Url.authorize()
        let parameters: Parameters = Params.credentials()
        
        Alamofire.request(url, method: .post, parameters: parameters).responseDecodableObject(decoder: JSONDecoder()) { (response: DataResponse<NexaasIdUser>) in
            let repo = response.result.value
            
            completion(repo)
        }
    }
    
    static func getUser(accessToken: String,completion: @escaping (User?) -> ()) {
        let url = Url.getUser()
        let headers = Headers.authorization(accessToken: accessToken)
        
        Alamofire.request(url, method: .get, headers: headers).responseDecodableObject(decoder: JSONDecoder()) { (response: DataResponse<User>) in
            let repo = response.result.value
            
            completion(repo)
        }
    }

}
