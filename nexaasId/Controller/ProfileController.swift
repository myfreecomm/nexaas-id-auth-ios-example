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
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUI()

    }
    
    func loadUI() {
        
        if let user = user {
            
            uuidLabel.text =  user.uuid
            nameLabel.text =  user.full_name
            emailLabel.text =  user.email
            languageLabel.text =  user.language ?? ""
            timezoneLabel.text =  user.timezone ?? ""
        }
        
        
    }
    
    
    @IBAction func onOkButtonClicked(_ sender: UIButton) {
        
        Singleton.clear()
        self.dismiss(animated: true, completion: nil)
    }
    
}
