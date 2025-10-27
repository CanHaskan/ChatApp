//
//  ChangeUsernameVC.swift
//  Smack
//
//  Created by Can Haskan on 27.10.2025.
//

import UIKit

class ChangeUsernameVC: UIViewController {
    
    @IBOutlet weak var newUsernameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeUsernameBtnPressed(_ sender: Any) {
        guard let newName = newUsernameTxt.text, !newName.isEmpty else { return }
        
        AuthService.instance.updateUserName(newName: newName) { success in
            if success {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    self.dismiss(animated: true, completion: nil)
                }
            } 
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

