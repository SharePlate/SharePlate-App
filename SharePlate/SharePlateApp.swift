//
//  SharePlateApp.swift
//  SharePlate
//
//  Created by robert theo on 13/08/24.
//
import netfox
import SwiftUI

@main
struct SharePlateApp: App {
    
    init() {
        #if DEBUG
        NFX.sharedInstance().start()
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
