//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/11/23.
//

import SwiftUI

@main
struct CitySights: App {
    
    @State var model = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
                .fullScreenCover(isPresented: .constant(true)){
                 //Todo Dismiss
                } content: {
                    OnboardingView()
                }
               
        }
    }
}
