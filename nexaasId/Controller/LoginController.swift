//
//  LoginController.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 29/10/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import UIKit
import p2_OAuth2

class LoginController: UIViewController {
    
    @IBOutlet weak var enterButton: UIButton!{
        didSet{
            
            enterButton.layer.cornerRadius = self.enterButton.frame.size.width/20
            enterButton.layer.masksToBounds = true
        }
    }

    
    var loader: OAuth2DataLoader?
    var user: User?
    
    var oauth2 = OAuth2CodeGrant(settings: [
        "client_id": "5USYUVZHRFD7ZLXZA3BNYGW6HY",
        "client_secret": "ZFZAP5WR7VD6XJDVS7JKMYVZ7U",
        "grant_type": "client_credentials",
        "authorize_uri": "\(Url.authorize())",
        "scope": "profile",
        "response_type": "code",
        "redirect_uris": ["nexaasId://login"],
        ] as OAuth2JSON)
    
    override func viewDidLoad() {
        super.viewDidLoad()

      print(user)
      
    }
    
    @IBAction func onEnterClicked(_ sender: UIButton) {
    
        
        // TODO: FIX Oauth2 callback
        
        if oauth2.isAuthorizing {
            oauth2.abortAuthorization()
            return
        }
        
        sender.setTitle("Authorizing...", for: UIControl.State.normal)
        
        oauth2.authConfig.authorizeEmbedded = true
        oauth2.authConfig.authorizeContext = self
        oauth2.logger = OAuth2DebugLogger(.trace)
        let loader = OAuth2DataLoader(oauth2: oauth2)
        self.loader = loader
        
        

//
//            loader.perform(request: tokenRequest ) { response in
//            do {
//                let json = try response.responseJSON()
//
//                print(json)
//
//            }
//            catch let error {
//                self.didCancelOrFail(error)
//            }
//        }
//
        oauth2.authorize() { authParameters, error in
            if let params = authParameters {
                print("Authorized! Access token is in `oauth2.accessToken`")
                print("Authorized! Additional parameters: \(params)")
            
            }
            else {
                print("Authorization was canceled or went wrong: \(error)")   // error will not be nil
            }
        }

   
    }
    
    var tokenRequest: URLRequest {
        var request = URLRequest(url: URL(string: "\(Url.getUser())")!)
        let params = "grant_type=authorization_code&client_id=\(Url.CLIENT_ID)&client_secret\(Url.CLIENT_SECRET)&code=125b7e039fce9ae3e86dd1a288df5e3d0087f5f9c3c1a586d74c44ca732b8189&redirect_uri=urn:ietf:wg:oauth:2.0:oob"
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.setValue("Bearer 2a6e5c4e34923709aadb63f2e2961a8b08428e7dbdcfcc5c2b5e999026a0ee34", forHTTPHeaderField: "Authorization")
       // request.httpBody = params.data(using: .utf8)
        request.httpMethod = "GET"
        return request
    }
    
    func didGetAccessToken(dict: [String: Any], loader: OAuth2DataLoader?) {
        
        if let code = dict["full_name"] as? String {
            
            print("meu nome é \(code)")
        
        }
        
    }
  
    
    func didCancelOrFail(_ error: Error?) {
        DispatchQueue.main.async {
            if let error = error {
                print("Authorization went wrong: \(error)")
            }
           
        }
        
    }
}
