//
//  UserDataService.swift
//  Smack
//
//  Created by Can Haskan on 17.10.2025.
//

import Foundation

class UserDataService {
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name:String) {
        
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
        }
    
    func setAvatarName(avatarName:String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
                
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        let r = scanner.scanUpToCharacters(from: comma)
        let g = scanner.scanUpToCharacters(from: comma)
        let b = scanner.scanUpToCharacters(from: comma)
        let a = scanner.scanUpToCharacters(from: comma)?
                    .trimmingCharacters(in: CharacterSet(charactersIn: "] "))
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else { return defaultColor}
        guard let gUnwrapped = g else { return defaultColor}
        guard let bUnwrapped = b else { return defaultColor}
        guard let aUnwrapped = a else { return defaultColor}
        
        guard
            let rFloat = Double(rUnwrapped),
            let gFloat = Double(gUnwrapped),
            let bFloat = Double(bUnwrapped),
            let aFloat = Double(aUnwrapped)
        else {
            return defaultColor
        }
        
        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newUIColor
    }
    
    func logoutUser() {
        id = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.AuthToken = ""
    }

}
