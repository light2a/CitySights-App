//
//  ContentView.swift
//  CitySights App
//
//  Created by duc on 02/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) private var model
    @State var bool = 1
    var body: some View {
        @Bindable var model = model
        VStack{
            HStack {
                TextField("What are you looking for?", text: $model.query)
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
            //show picker
            
            Picker("", selection: $bool) {
                Text("List")
                    .tag(1)
                Text("Map")
                    .tag(0)
                
            }
            .pickerStyle(SegmentedPickerStyle())
            //show map or list
            if bool==0 { 
                MapView()
            }
            else  {
                ListView()
            }
            
        }
        .padding()
        .onAppear{
            model.getBusiness()
        }
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
        
    }
}

#Preview {
    HomeView().environment(BusinessModel())
}
