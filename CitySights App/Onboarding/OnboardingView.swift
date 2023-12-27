//
//  OnboardingView.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/27/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            OnboardingViewDetail(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                                 headline: "Welcome to City Sights",
                                 subHeadline: "City Sights helps you find the best of the city!") {
                print("hello")
            }
                                 .ignoresSafeArea()
            
            OnboardingViewDetail(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255),
                                 headline: "Discover your city",
                                 subHeadline: "We'll show you the best restaurants based on your location.") {
                print("Second")
            }
                                 .ignoresSafeArea()
            
            
        }
                .tabViewStyle(.page)
                .ignoresSafeArea()
        }
        
    }


#Preview {
    OnboardingView()
}
