//
//  SharePlateApp.swift
//  SharePlate
//
//  Created by robert theo on 13/08/24.
//
import netfox
import SwiftUI
import FirebaseCore
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil)
    -> Bool {
        return true
    }
}

@main
struct SharePlateApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authManager: AuthManager

    var sharedModelContainer: ModelContainer = {
            let schema = Schema([
                UserModel.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()

    
    init() {
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
        let authManager = AuthManager()
        _authManager = StateObject(wrappedValue: authManager)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack() {
                MainPageView()
                    .environmentObject(authManager)
            }
            .modelContainer(sharedModelContainer)
        }
    }
}
