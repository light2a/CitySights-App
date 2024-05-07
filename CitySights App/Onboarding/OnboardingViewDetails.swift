//
//  OnboardingViewDetails.swift
//  CitySights App
//
//  Created by duc on 07/05/2024.
//

import SwiftUI

struct OnboardingViewDetails: View {
    
    var bgColor: Color
    var headline: String
    var subHeadLine: String
    var buttonAction: () -> Void // kieu function la var
    
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack(spacing : 0) {
                Spacer()
                Spacer()
                Image("onboarding")
                Text(headline)
                    .font(Font.system(size: 22))
                    .bold()
                    .padding(.top, 32)
                Text(subHeadLine)
                    .padding(.horizontal)
                    .padding(.top, 4)
                Spacer()
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(Color.white)
                            .frame(height: 50)
                        Text("Continue")
                            .bold()
                            .foregroundStyle(Color.black)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 115)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to City Sights", subHeadLine: "City Sights helps you find the best of the city!") {
        //
    }
}
