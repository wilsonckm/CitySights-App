//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/18/23.
//

import SwiftUI

struct BusinessDetailView: View {
    
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        
        let business = model.selectedBusiness
        
        VStack (spacing: 0) {
            ZStack (alignment: .trailing) {
                
                if let imageUrl = business?.imageUrl {
                    AsyncImage(url: URL(string: imageUrl)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 164)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                           
                            
                    } placeholder: {
                        ProgressView()
                            .frame(width: 375, height: 200)
                    }

                } else {
                    Image("detail-placeholder-image")
                        .resizable()
                }
                

                VStack {
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 164)
            if let isClose = business?.isClosed {
             
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(isClose ? .red: .green)
                    Text(isClose ? "Closed" : "Open")
                        .padding(.horizontal)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                }
                .frame(width: 400, height: 30)
            }
            
            ScrollView {
                VStack (alignment: .leading, spacing: 0) {
                        
                    
                    Text(business?.name ?? "Business Name" )
                        .bold()
                        .font(Font.system(size: 21))
                        .padding(.vertical, 16.0)
                    Text("\(business?.location?.address1 ??  "Address"), \(business?.location?.city ?? "City")")
                    Text("\(business?.location?.state ??  "State"), \(business?.location?.zipCode ?? "Zip Code"), \(business?.location?.country ??  "Country")")
                        .padding(.bottom, 10)
                    Image("regular_\(business?.rating ?? 0)")
                        .padding(.bottom, 16)
                    
                                        
                    Divider()
                    
                    HStack {
                        Image(systemName: "phone")
                        
                        if let url = URL(string: "tel: \(business?.phone ?? "")") {
                            Link(destination: url) {
                                Text(business?.phone ?? "")
                            }
                        }
                        else {
                            Text(business?.phone ?? "")
                        }
                        
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                        Spacer()
                        Divider()
                    HStack {
                        Image(systemName: "globe")
        
                        if let url = URL(string: "\(business?.url ?? "")") {
                            Link(destination: url) {
                                Text(business?.url ?? "")
                                    .lineLimit(1)
                            }
                        }
                        else {
                            Text(business?.url ?? "")
                                .lineLimit(1)
                        }
                        
                        
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                        Spacer()
                        Divider()
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ?? 0) reviews")

                    }
                    .padding(.vertical, 12)
                    
                        Spacer()
                    
                    }
                }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BusinessDetailView()
}
