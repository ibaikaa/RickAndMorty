//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by ibaikaa on 7/6/23.
//

import SwiftUI

final class CharactersViewModel: ObservableObject {
    
    // MARK: - Published properties
    @Published var characters: [Character] = []
    @Published var showAlert = false
    @Published var errorDescription = ""
    
    // MARK: - Private properties
    private let networkLayer = NetworkLayer.shared
    private var pagesCount: Int = 1
    private var totalPages = 0
    
    // MARK: - Init() method
    init() { fetchTotalPages() }
    
    // MARK: - Helping methods
    private func handleErrorOccurence(_ error: Error) {
        showAlert = true
    
        if let apiError = error as? ApiError {
            errorDescription = apiError.description
        } else {
            errorDescription = error.localizedDescription
        }
    }

    // MARK: - API call private methods
    private func fetchTotalPages() {
        Task {
            do {
                totalPages = try await networkLayer
                    .getCharacters()
                    .info
                    .pages
                
            } catch {
                handleErrorOccurence(error)
            }
        }
    }
    
    // MARK: - API call public methods
    public func fetchCharacters() {
        Task {
            do {
                let fetchedCharacters = try await networkLayer
                    .getCharacters(page: pagesCount)
                    .results
     
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.characters.append(contentsOf: fetchedCharacters)
                }
                
            } catch {
                handleErrorOccurence(error)
            }
        }
    }
    
    public func loadMoreContent(currentItem item: Character) {
        if ContentLoadingAnalyzer.shouldLoadMoreContent(
            of: characters,
            item: item,
            currentPage: pagesCount,
            totalPages: totalPages
        ) {
            pagesCount += 1
            fetchCharacters()
        }
    }
    
}
