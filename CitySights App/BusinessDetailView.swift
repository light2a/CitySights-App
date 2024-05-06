//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by duc on 04/05/2024.
//

import SwiftUI

struct BusinessDetailView: View {
    @Environment(BusinessModel.self) private var model
    var body: some View {
        
        let  business = model.selectedBusiness
        
        VStack (spacing: 0) {
            ZStack (alignment: .trailing) {
                Image("detail-placeholder-image")
                    .resizable()
                VStack{
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)
                }
                
            }
            .frame(height: 164)
            
            if let isClose =  business?.isClosed {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(isClose ? .red : .green)
                    Text(isClose ?"Close":"Open")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .frame(height: 36)
            }
            
            
            ScrollView {
                VStack(alignment: .leading,spacing: 0 ){
                    Text(business?.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.top, 16)
                    Text("\(business?.location?.address1 ?? ""), \(business?.location?.city ?? "")")
                    Text("\(business?.location?.state ?? "") \(business?.location?.zipcode ?? ""), \(business?.location?.country ?? "")")
                        .padding(.bottom, 10)
                    Image("regular_\(business?.rating ?? 0)")
                        .padding(.bottom, 16)
                    Divider()
                        .padding(.bottom, 12)
                    HStack {
                        Image(systemName: "phone")
                        Text(business?.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    Divider()
                        .padding(.top, 12)
                    
                    HStack {
                        Image(systemName: "globe")
                        Text(business?.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ??  0)  reviews")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.top, 12)
                    Spacer()
                }
            }
            .padding(.horizontal)

        }
    }
}

#Preview {
    BusinessDetailView()
}
