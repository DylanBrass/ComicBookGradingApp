//
//  ComicBookGradingAppApp.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-16.
//

import SwiftUI
import FirebaseCore



@main
struct ComicBookGradingAppApp: App {

    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
