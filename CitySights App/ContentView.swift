//
//  ContentView.swift
//  CitySights App
//
//  Created by duc on 02/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State var businesses = [Business]()
    @State var selectedBusiness: Business?
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        VStack{
            HStack {
                TextField("What are you looking for?", text: $query)
                Button {
                    
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            List{
                ForEach(businesses) { business in
                    VStack (spacing:20){
                        HStack (spacing: 0){
                            Image("list-placeholder-image")
                                .padding(.trailing,16) //them 16 theo sau cai Hstack nghia la them ben phai
                            VStack(alignment: .leading) {
                                Text(business.name ?? "Res")
                                    .font(Font.system(size: 15))
                                    .bold()
                                Text(TextHelper.distanceAwayText(meters: business.distance ?? 0))
                                    .font(Font.system(size: 16))
                                    .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                            }
                            Spacer()
                            Image("regular_\(business.rating ?? 0)")
                            
                        }
                        Divider()
                        
                    }
                    .onTapGesture {
                        selectedBusiness = business
                    }//bien no thanh button
                    
                }
                .listRowSeparator(.hidden)// che dong ngan cach
            }
            .listStyle(.plain)
            
        }
        .padding()
        .task {
            businesses = await service.businessSearch()
        }
        .sheet(item: $selectedBusiness) { item in
            BusinessDetailView(business: item)
        }
        
    }
}

#Preview {
    ContentView()
}
