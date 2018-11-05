//
//  LoginController.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 29/10/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import UIKit
import OAuthSwift


class LoginController: UIViewController {
    
    var oauthswift: OAuth2Swift?
    
    @IBOutlet weak var enterButton: UIButton!{
        didSet{
            
            enterButton.layer.cornerRadius = self.enterButton.frame.size.width/20
            enterButton.layer.masksToBounds = true
        }
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func onEnterClicked(_ sender: UIButton) {
        
        
        let oauthswift = OAuth2Swift(
            consumerKey:    "\(Url.CLIENT_ID)",
            consumerSecret: "\(Url.CLIENT_SECRET)",
            authorizeUrl:   "\(Url.authorize())",
            accessTokenUrl: "\(Url.signin())",
            responseType:   "code"
        )
        self.oauthswift = oauthswift
        let state = generateState(withLength: 20)
        
        UIJustHUD.shared.showInView(view: self.view)
        
        _ = oauthswift.authorize(
            withCallbackURL: URL(string: "com.nexaasId://callback/login")!,
            scope: "profile", state:state,
            success: { credential, response, parameters in
                
                Singleton.accessToken(accessToken: credential.oauthToken)
                Core.getUser(accessToken: credential.oauthToken, completion: { (userResponse, statusCode) in
                    
                    if statusCode == 200 {
                        
                        UIJustHUD.shared.hide()
                        
                        Singleton.user(user: userResponse!)
                        
                        self.present(self.storyboard?.instantiateViewController(withIdentifier: "ProfileController") as! ProfileController, animated: true, completion: nil)
                        
                    }else{
                        
                           UIJustHUD.shared.hide()
                        
                        print("Status code: \(String(describing: statusCode))")
                        
                    }
                })
        },
            failure: { error in
                
                UIJustHUD.shared.hide()
                print(error.description)
        }
        )
        
    }
    
    
    
}
