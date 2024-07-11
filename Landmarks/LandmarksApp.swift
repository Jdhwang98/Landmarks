//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 5/29/24.
//

import SwiftUI

@main
// Define a struct named LandmarksApp that conforms to the App protocol, which represents the entry point of the app.
struct LandmarksApp: App {
    //State transfers the changes from one page to another
    // Use @StateObject to create a persistent and observable instance of ModelData.
    // This ensures that changes in ModelData are reflected across different views.
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        
        WindowGroup {
            
            // Set the initial view of the app to ContentView.
            ContentView()
                
                // Pass the shared data through the views
                .environmentObject(modelData)
        }
    }
}
