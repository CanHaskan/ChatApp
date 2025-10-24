//
//  Constants.swift
//  Smack
//
//  Created by Can Haskan on 10.10.2025.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let BASE_URL = "http://localhost:3005"
let URL_REGISTER = "http://localhost:3005/v1/account/register"
let URL_LOGIN = "http://localhost:3005/v1/account/login"
let URL_USER_ADD = "http://localhost:3005/v1/user/add"
let URL_USER_BY_EMAIL = "http://localhost:3005/v1/user/byEmail"
let URL_GET_CHANNELS = "http://localhost:3005/v1/channel"

//Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)

//Notification
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUSerDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("chanelSelected")


//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// User Defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIN"
let USER_EMAIL = "userEmail"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

var BEARER_HEADER: [String: String] {
    return [
        "Authorization": "Bearer \(AuthService.instance.AuthToken)",
        "Content-Type": "application/json; charset=utf-8"
    ]
}

