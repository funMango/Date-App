//
//  dateAppApp.swift
//  dateApp
//
//  Created by 이민호 on 1/18/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct dateAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            CategoryView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      Auth.auth().useEmulator(withHost: "localhost", port: 9099)
      
    // Firebase 실행확인 print
    // print("Configured Firebase!")

    return true
  }
}
