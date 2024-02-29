//
//  ParkView.swift
//  Parks
//
//  Created by Mariam Babutsidze on 29.02.24.
//

import SwiftUI

struct ParkView: View {
    var park: Park
    
    var body: some View {
        ZStack {
            Rectangle()
                .contentShape(Rectangle())
                .overlay {
                    AsyncImage(
                        url: park.icon,
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
                .opacity(0.8)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack(spacing: 4) {
                HStack {
                    Spacer()
                    Button("", systemImage: "heart", action: {
                        
                    })
                    .foregroundColor(.red)
                    .bold()
                }
                Spacer()
                HStack {
                    Text(park.title)
                        .bold()
                        .foregroundStyle(.white)
                    Spacer()
                }
                HStack {
                    Label(park.rating, systemImage: "star.fill")
                        .bold()
                        .foregroundStyle(.yellow)
                    Spacer()
                }
            }
            .padding(20)
            
        }
        .frame(height: 200)
    }
}

#Preview {
    ParkView(park: Park.mock)
}
