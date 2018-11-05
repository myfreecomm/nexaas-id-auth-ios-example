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
            
            print("Success: \(response.result.isSuccess)")
            print("Response String: \(response.result.value)")
            
            var statusCode = response.response?.statusCode
            if let error = response.result.error as? AFError {
                statusCode = error._code // statusCode private
                switch error {
                case .invalidURL(let url):
                    print("Invalid URL: \(url) - \(error.localizedDescription)")
                case .parameterEncodingFailed(let reason):
                    print("Parameter encoding failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                case .multipartEncodingFailed(let reason):
                    print("Multipart encoding failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                case .responseValidationFailed(let reason):
                    print("Response validation failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    
                    switch reason {
                    case .dataFileNil, .dataFileReadFailed:
                        print("Downloaded file could not be read")
                    case .missingContentType(let acceptableContentTypes):
                        print("Content Type Missing: \(acceptableContentTypes)")
                    case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                        print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                    case .unacceptableStatusCode(let code):
                        print("Response status code was unacceptable: \(code)")
                        statusCode = code
                    }
                case .responseSerializationFailed(let reason):
                    print("Response serialization failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    // statusCode = 3840 ???? maybe..
                }
                
                print("Underlying error: \(String(describing: error.underlyingError))")
            } else if let error = response.result.error as? URLError {
                print("URLError occurred: \(error)")
            } else {
                print("Unknown error: \(String(describing: response.result.error))")
            }
            
            print(statusCode ?? 0) // the status code
            
            completion(repo, error)
        }
    }

}
