//
//  ProfileController.swift
//  nexaasId
//
//  Created by Rodrigo Andrade on 31/10/18.
//  Copyright © 2018 Rodrigo Andrade. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var uuidLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var timezoneLabel: UILabel!
    
    @IBOutlet weak var okButton: UIButton! {
        didSet{
            okButton.layer.cornerRadius = self.okButton.frame.size.width/20
            okButton.layer.masksToBounds = true
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.loadUI()
    }
    
    func loadUI() {
        
        if let user = Singleton.user() {
            
            uuidLabel.text =  user.id
            nameLabel.text =   user.full_name
            emailLabel.text =  user.email
            languageLabel.text =  user.language ?? ""
            timezoneLabel.text =  user.timezone ?? ""
        }
        
        
    }
    
    
    @IBAction func onOkButtonClicked(_ sender: UIButton) {
        
        UIJustHUD.shared.showInView(view: self.view)
        
        Core.signOut(accessToken: Singleton.accessToken()!) { (statusCode) in
            
            if statusCode == 200 {
                
                UIJustHUD.shared.hide()
                Singleton.clear()
                self.dismiss(animated: true, completion: nil)
                
            }else{
                
                print("Status code: \(String(describing: statusCode))")
            }
            
        }
    }
    
    
    
}
