//
//  AppDelegate.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/6/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        let word = Words()
        word.content = "hello"
        word.note = "xin chao"
        do{
            let realm = try Realm()
            try realm.write {
                realm.add(word)
            }
        }catch{
            print("fail")
        }
        return true
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

