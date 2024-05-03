//
//  ContentView.swift
//  CitySights App
//
//  Created by duc on 02/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    
    var body: some View {
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
        .padding()
        .onAppear() {
            print(Bundle.main.infoDictionary?["API_KEY"] as? String)
        }
    }
}

#Preview {
    ContentView()
}
