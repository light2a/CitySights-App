//
//  OnboardingView.swift
//  CitySights App
//
//  Created by duc on 07/05/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(BusinessModel.self) private var model
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    var body: some View {
        ZStack {
            
            if selectedViewIndex == 0 {
                Color(red: 111/255, green: 154/255, blue: 189/255)
            } else {
                Color(red: 139/255, green: 166/255, blue: 65/255)
            }
        
            TabView (selection: $selectedViewIndex){
                OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to City Sights", subHeadLine: "City Sights helps you find the best of the city!") {
                    withAnimation{
                        selectedViewIndex = 1
                    }                //
                }
                .tag(0)
                .ignoresSafeArea()
                OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255), headline: "Discover your city", subHeadLine: "We'll show you the best restaurants, venues, based on your location.") {
                    //
                    model.getUserLocation()
                    dismiss()
                }
                .tag(1)
                .ignoresSafeArea()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            VStack {
                Spacer()
                HStack(spacing: 16){
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ?.white:.gray)
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ?.white:.gray)

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
