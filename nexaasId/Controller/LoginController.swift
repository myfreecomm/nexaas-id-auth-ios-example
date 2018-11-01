//
//  LoginController.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 29/10/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var enterButton: UIButton!{
        didSet{
            
            enterButton.layer.cornerRadius = self.enterButton.frame.size.width/20
            enterButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Core.credentials { (response) in
            
            if response != nil {
                
                print("deu certo")
            }else{
                
                print("deu ruim")
            }
        }
      
    }
    
    @IBAction func onEnterClicked(_ sender: UIButton) {
    }
    

}
