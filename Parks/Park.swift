//
//  Park.swift
//  Parks
//
//  Created by Mariam Babutsidze on 12.02.24.
//

import Foundation

public struct Park {
    let title: String
    let rating: String
    let icon: URL?
    
    init(park: Components.Schemas.Park) {
        self.title = park.title
        self.rating = String(park.rating)
        self.icon = URL(string: park.icon)
    }
}

extension Park {
    static let mock: Park = .init(park: .init(title: "Algeti National Park", rating: 4.0, icon: "https://nationalparks.ge/files/15300054817330624374_431322507318925_6228581445472878592_o.jpg"))
}
