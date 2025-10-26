//
//  SocketService.swift
//  Smack
//
//  Created by Can Haskan on 24.10.2025.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    private let manager: SocketManager
    let socket: SocketIOClient
    
    override init() {
        manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.compress])
        socket = manager.defaultSocket
        super.init()
    }
    
    func establishConnection() {
        socket.on(clientEvent: .connect) { _, _ in
        }
        socket.connect()
    }

    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        guard socket.status == .connected else {
            socket.once(clientEvent: .connect) { _, _ in
                self.socket.emit("newChannel", channelName, channelDescription)
                completion(true)
            }
            socket.connect()
            return
        }
        
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { dataArray, _ in
            guard
                let channelName = dataArray[0] as? String,
                let channelDesc = dataArray[1] as? String,
                let channelId = dataArray[2] as? String
            else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    func getChatMessage(completion: @escaping (_ newMessage: Message) -> Void) {
        socket.on("messageCreated") { dataArray, ack in
            guard let msgBody = dataArray[0] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            guard let userName = dataArray[3] as? String else {return}
            guard let userAvatar = dataArray[4] as? String else {return}
            guard let userVatarColor = dataArray[5] as? String else {return}
            guard let id = dataArray[6] as? String else {return}
            guard let timeStamp = dataArray[7] as? String else {return}
            
            let newMessage = Message(message: msgBody, userName: userName, channeld: channelId, userAvatar: userAvatar, userAvatarColor: userVatarColor, id: id, timestamp: timeStamp)
            
            completion(newMessage)
        }
    }
    
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String: String]) -> Void) {
        
        socket.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String: String] else {return}
            completionHandler(typingUsers)
        }
    }
}
