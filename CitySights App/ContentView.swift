//
//  ContentView.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    
    var body: some View {
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
        .padding()
        .onAppear(perform: {
            print(Bundle.main.infoDictionary?["API_KEY"] as? String)
        })
    }
}

#Preview {
    ContentView()
}
