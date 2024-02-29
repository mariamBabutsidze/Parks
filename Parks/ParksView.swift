//
//  ParksView.swift
//  Parks
//
//  Created by Mariam Babutsidze on 29.02.24.
//

import SwiftUI
import ComposableArchitecture

struct ParksView: View {
    let parksClient = ParksClient()
    @State var parks: [Park] = []
    let store: StoreOf<ParksFeature>
    
    var body: some View {
        VStack {
            ForEach(parks, id: \.title) { park in
                ParkView(park: park)
            }
            Spacer()
        }
        .padding()
        .task {
            do {
                parks = try await parksClient.getParks()
            } catch {
                
            }
        }
    }
}

#Preview {
    ParksView(store: Store(initialState: ParksFeature.State()) {
        ParksFeature()
    })
}
