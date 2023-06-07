//
//  Characters.swift
//  RickAndMorty
//
//  Created by ibaikaa on 4/6/23.
//

import Foundation

// MARK: - Character
struct CharacterGroup: Decodable {
    let results: [Character]
    let info: Info
}

struct Info: Decodable {
    let pages: Int
    let count: Int
}

struct Character: Decodable, Identifiable, DTOProtocol {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let created: String    
}

// MARK: - Location
struct CharacterLocation: Decodable {
    let name: String
    let url: String
}
