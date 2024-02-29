//
//  ParksFeature.swift
//  Parks
//
//  Created by Mariam Babutsidze on 29.02.24.
//

import ComposableArchitecture

@Reducer
struct ParksFeature {
    @ObservableState
    struct State: Equatable {
        var parks: [Park]
        var isLoading = false
    }
    
    enum Action {
        case parksOpened
        case parksCompleted
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case  .parksOpened:
            case .parksCompleted:
                
            }
        }
    }
}
