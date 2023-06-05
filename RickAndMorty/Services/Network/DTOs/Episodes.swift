//
//  Episodes.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import Foundation

struct EpisodesGroup: Decodable {
    let results: [Episode]
}

struct Episode: Decodable, Identifiable {
    let id: Int
    let name, airDate, episode: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, created
    }
}
