//
//  ContentView.swift
//  CitySights App
//
//  Created by duc on 02/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State var businesses = [Business]()
    
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
            List(businesses){ b in
                Text(b.name ?? "thoi")
            }
            
        }
        .padding()
        .task {
            businesses = await service.businessSearch()
        }
        
    }
}

#Preview {
    ContentView()
}
