//
//  Locations.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import Foundation

struct LocationsGroup: Decodable {
    let results: [Location]
}

struct Location: Decodable, Identifiable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
}
