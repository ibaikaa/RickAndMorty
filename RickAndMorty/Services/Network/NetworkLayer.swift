//
//  NetworkLayer.swift
//  RickAndMorty
//
//  Created by ibaikaa on 4/6/23.
//

import Foundation
import Combine
import Alamofire

final class NetworkLayer {
    /// Singleton
    static let shared = NetworkLayer()
    private init () { }
    
    private let session = URLSession(configuration: .default)
    
    private func decode<T: Decodable>(data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }
    
    private func validateError(for response: URLResponse) -> ApiError? {
        guard let response = response as? HTTPURLResponse else { return ApiError.strangeResponse }
        
        switch response.statusCode {
            case 404: return ApiError.notFound
            case 500: return ApiError.internalServerError
            default: return nil
        }
    }
    
    private func getDataForRequest<T: Decodable>(
        _ request: URLRequest
    ) async throws -> T {
        let (data, response) = try await session.data(for: request)
        if let error = validateError(for: response) { throw error }
        return try decode(data: data)
    }

    public func getCharacters(page: Int) async throws -> CharacterGroup {
        guard let url = ApiRouter
            .getCharacters(page: page)
            .url
        else { throw ApiError.invalidURL }
        
        return try await getDataForRequest(URLRequest(url: url))
    }
    
    public func getEpisodes(page: Int) async throws -> EpisodesGroup {
        guard let url = ApiRouter
            .getEpisodes(page: page)
            .url
        else { throw ApiError.invalidURL }
        
        return try await getDataForRequest(URLRequest(url: url))
    }
    
    public func getLocations(page: Int) async throws -> LocationsGroup {
        guard let url = ApiRouter.getLocations(page: page).url else {
            throw ApiError.invalidURL
        }
        
        return try await getDataForRequest(URLRequest(url: url))
    }
    
}
