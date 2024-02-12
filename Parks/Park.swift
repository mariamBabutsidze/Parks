//
//  Park.swift
//  Parks
//
//  Created by Mariam Babutsidze on 12.02.24.
//

import Foundation

public struct Park {
    let title: String
    let description: String
    
    init(park: Components.Schemas.Park) {
        self.title = park.title
        self.description = park.description
    }
}
