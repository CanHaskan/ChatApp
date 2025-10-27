//
//  ProfileVCViewController.swift
//  Smack
//
//  Created by Can Haskan on 21.10.2025.
//

import UIKit

class ProfileVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        setupView()
    }
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!    
    @IBOutlet weak var bgView: UIView!
    
    func setupView() {
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVCViewController.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        userName.text = UserDataService.instance.name
    }
    
    @objc func closeTap(_ recognicer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)        
    }
    
    @IBAction func changeUsernamePressed(_ sender: Any) {
        let changeUsernameVC = ChangeUsernameVC(nibName: "ChangeUsernameVC", bundle: nil)
        present(changeUsernameVC, animated: true, completion: nil)
    }

}
