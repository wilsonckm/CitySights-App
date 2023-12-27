//
//  MapView.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/27/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map()
    }
}

#Preview {
    MapView()
        .environment(BusinessModel())
}
