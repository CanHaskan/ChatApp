//
//  AppDelegate.swift
//  Smack
//
//  Created by Can Haskan on 12.03.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SocketService.instance.establishConnection()
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // App aktif olunca tekrar bağlan
        SocketService.instance.establishConnection()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Arka plana geçince bağlantıyı kapat
        SocketService.instance.closeConnection()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Uygulama tamamen kapanırken de bağlantıyı kapat
        SocketService.instance.closeConnection()
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration",
                                    sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}


