//
//  ContentView.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var businesses = [Business]()
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    
                    //To do: Implement query
                }, label: {
                    Text("Go")
                        .padding(.horizontal)
                        .background(.pink)
                })
            }
            List (businesses) { b in Text(b.name ?? "Nil") }
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
