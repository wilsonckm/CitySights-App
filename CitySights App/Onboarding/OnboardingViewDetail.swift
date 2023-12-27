//
//  OnboardingViewDetail.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/27/23.
//

import SwiftUI

struct OnboardingViewDetail: View {
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack (spacing: 0) {
                Spacer()
                Spacer()
                
                Image("onboarding")
                    .padding(.bottom, 32)
                Text(headline)
                    .bold()
                    .font(.system(size: 22))
                    .foregroundStyle(.white)
                Text(subHeadline)
                    .foregroundStyle(.white)
                    .padding(.bottom, 64)
                    .padding(.horizontal, 16)
                
                Spacer()
                
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .padding(.horizontal, 10.0)
                            .foregroundColor(.white)
                            .frame(height: 50)
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
                .padding(.bottom, 118)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingViewDetail(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                         headline: "Welcome to City Sights",
                         subHeadline: "City Sights helps you find the best of the city!") {
            //Empty Action
    }
}
