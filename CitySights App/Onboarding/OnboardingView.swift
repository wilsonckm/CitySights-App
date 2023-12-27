//
//  OnboardingView.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/27/23.
//

import SwiftUI

struct OnboardingView: View {
    @Environment (\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        ZStack {
            if selectedViewIndex == 0 {
                Color(Color(red: 111/255, green: 154/255, blue: 189/255))
                    .ignoresSafeArea()
            } else {
                Color(Color(red: 139/255, green: 166/255, blue: 65/255))
                    .ignoresSafeArea()
            }
            
            TabView (selection: $selectedViewIndex) {
                OnboardingViewDetail(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                                     headline: "Welcome to City Sights",
                                     subHeadline: "City Sights helps you find the best of the city!") {
                    withAnimation {
                        selectedViewIndex = 1
                    }
                }
                                     .tag(0)
                                     .ignoresSafeArea()
                
                OnboardingViewDetail(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255),
                                     headline: "Discover your city",
                                     subHeadline: "We'll show you the best restaurants based on your location.") {
                    dismiss()
                    
                }
                                     .tag(1)
                                     .ignoresSafeArea()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
                 
            
            VStack {
                Spacer()
                HStack (spacing: 16) {
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                    Spacer()
                }
                .padding(.bottom, 220)
            }
        }
        .ignoresSafeArea()
        }
        
    }


#Preview {
    OnboardingView()
}
