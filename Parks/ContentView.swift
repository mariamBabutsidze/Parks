//
//  ContentView.swift
//  Parks
//
//  Created by Mariam Babutsidze on 08.02.24.
//

import SwiftUI

struct ContentView: View {
    let parksClient = ParksClient()
    @State var parks: [Park] = []
    
    var body: some View {
        VStack {
            ForEach(parks, id: \.title) { park in
                Text(park.title)
            }
        }
        .padding()
        .onAppear {
            Task {
                parks = try await parksClient.getParks()
            }
        }
    }
}

#Preview {
    ContentView()
}
