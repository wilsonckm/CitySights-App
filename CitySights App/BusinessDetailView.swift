//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/18/23.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "" )
    }
}

#Preview {
    BusinessDetailView()
}
