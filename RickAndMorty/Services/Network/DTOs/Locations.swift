//
//  Locations.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import Foundation

struct LocationsGroup: Decodable {
    let results: [Location]
    let info: Info
}

struct Location: Decodable, Identifiable, DTOProtocol {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
}
