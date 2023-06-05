//
//  ApiRouter.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import Foundation
import Alamofire

protocol ApiRouterProtocol {
    var method: HTTPMethod { get }
    var path: String { get }
    var url: URL? { get }
}

enum ApiRouter: ApiRouterProtocol {
    case getCharacters(page: Int )
    case getEpisodes(page: Int)
    case getLocations(page: Int)
    
    var baseURL: URL { URL(string: "www.rickandmortyapi.com")! }
    
    var method: HTTPMethod { .get }

    var path: String {
        switch self {
        case .getCharacters:
            return "/api/character"
        case .getEpisodes:
            return "/api/episode"
        case .getLocations:
            return "/api/location"
        }
    }
    
    var queryItem: URLQueryItem {
        switch self {
        case .getCharacters(let page):
            return URLQueryItem(name: "page", value: "\(page)")
        case .getEpisodes(let page):
            return URLQueryItem(name: "page", value: "\(page)")
        case .getLocations(let page):
            return URLQueryItem(name: "page", value: "\(page)")
        }
    }

    var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL.absoluteString
        components.path = path
        components.queryItems = [queryItem]
        return components
    }
    
    var url: URL? { components.url }
    
}


