//
//  Constants.swift
//  Smack
//
//  Created by Can Haskan on 10.10.2025.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let URL_REGISTER = "http://localhost:3005/v1/account/register"
//let URL_REGISTER = "ht/tp://192.168.1.22:localhost:3005/v1/account/register"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// User Defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIN"
let USER_EMAIL = "userEmail"
