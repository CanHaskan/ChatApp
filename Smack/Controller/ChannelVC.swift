//
//  ChannelVC.swift
//  Smack
//
//  Created by Can Haskan on 16.03.2025.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 80

    }
    
    @IBAction func LoginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
   

}
