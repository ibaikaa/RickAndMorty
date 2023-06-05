//
//  Int+SatisfiesMaxBounds.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import Foundation

extension Int {
    enum ApiDataType {
        case characters, episodes, locations
    }
    
    func satisfiesMaxBound(for dataType: ApiDataType) -> Bool {
        switch dataType {
            case .characters: return self + 1 <= Constants.CHARACTERS_MAX_PAGES
            case .episodes: return self + 1 <= Constants.EPISODES_MAX_PAGES
            case .locations: return self + 1 <= Constants.LOCATIONS_MAX_PAGES
        }
    }
}
