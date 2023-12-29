//
//  ContentView.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedTab = 0
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorySelection = "restaurants"
    @State var query = ""
    @FocusState var queryBoxFocused: Bool
    @State var showOptions = false
    
    var body: some View {
        @Bindable var model = model
        
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                    .onTapGesture {
                        withAnimation{
                            showOptions = true
                        }
                    }
                Button(action: {
                    //Perform search
                    withAnimation {
                        showOptions = false
                        queryBoxFocused = false
                    }
                    model.getBusinesses(query: query, options: getOptionsString(), category: categorySelection)
                }, label: {
                    Text("Go")
                        .padding(.horizontal, 20)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                })
            }
            .padding(.horizontal)
            
            //Query options
            if showOptions {
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
                .padding(.horizontal, 40)

            }
            
                    
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if model.locationAuthStatus == .denied {
                Spacer()
                Text("Please allow location services for this app to see sights near you.")
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Text("Open app privacy settings")
                }
                .buttonStyle(.bordered)
                Spacer()

            }
            
            else if selectedTab == 1 {
                MapView()
                    .onTapGesture {
                        withAnimation {
                            queryBoxFocused = false
                            showOptions = false
                        }
                    }
            } else {
                ListView()
                    .onTapGesture {
                        withAnimation {
                            queryBoxFocused = false
                            showOptions = false
                        }
                    }
            }
        }
        
        .padding()
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
    
    func getOptionsString() -> String {
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
    HomeView()
        .environment(BusinessModel())
}
