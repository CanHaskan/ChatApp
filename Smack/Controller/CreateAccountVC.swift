//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Can Haskan on 10.10.2025.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("✅ Uygulama çalıştı ve CreateAccountVC yüklendi!")

    }

    
    
    @IBAction func createAccntPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else
        {return}
        guard let pass = passTxt.text , passTxt.text != "" else
        {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { success in
            if success{
                print("registered user!")
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
