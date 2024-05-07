//
//  ContentView.swift
//  CitySights App
//
//  Created by duc on 02/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) private var model
    @State var query: String = ""
    @FocusState  var queryBoxFocused : Bool
    @State var showOption = false
    
    @State var bool = 1
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorySelection = "restaurants"
    var body: some View {
        @Bindable var model = model
        VStack{
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                    .onTapGesture {
                        withAnimation {
                            showOption = true
                        }
                    }
                Button {
                    withAnimation {
                        showOption = false
                        queryBoxFocused = false

                    }
                    // Perform a search
                    model.getBusiness(query: query, options: getOptionString(), category: categorySelection)
                    
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            //Query options show if text box is focus
            if showOption {
                VStack {
                    Toggle("Popular", isOn: $popularOn)
                    Toggle("Deals", isOn: $dealsOn)
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker("Category", selection: $categorySelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            Text("Arts")
                                .tag("arts")
                        }
                    }
                    
                }
                .padding(.horizontal,40)
                .transition(.push(from: .top))
            }
            
            //show picker
            
            Picker("", selection: $bool) {
                Text("List")
                    .tag(1)
                Text("Map")
                    .tag(0)
                
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal
            )
            //show map or list
            if model.locationSatus == .denied {
                Text("ko mo vi tri dung dung")
                Button(action: {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    Text("Open")
                })
            }
            else if bool==0 {
                MapView()
                    .onTapGesture {
                        withAnimation{
                            showOption = false
                            queryBoxFocused = false
                        }
                        
                }
            }
            else  {
                ListView()
                    .onTapGesture {
                        withAnimation{
                            showOption = false
                            queryBoxFocused = false
                        }
                    }
            }
            
        }
        .padding()
        
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
        
    }
    
    func getOptionString() -> String {
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")

    }
}

#Preview {
    HomeView().environment(BusinessModel())
}
