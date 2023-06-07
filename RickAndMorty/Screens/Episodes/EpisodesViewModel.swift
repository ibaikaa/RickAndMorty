//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by ibaikaa on 7/6/23.
//

import SwiftUI

final class EpisodesViewModel: ObservableObject {
    
    // MARK: - Published properties
    @Published var episodes: [Episode] = []
    @Published var showAlert = false
    @Published var errorDescription = ""
    
    // MARK: - Private properties
    private let networkLayer = NetworkLayer.shared
    private var pagesCount: Int = 1
    private var totalPages = 0
    
    // MARK: - Init() method
    init() { getTotalPages() }
    
    // MARK: - Helping methods
    private func updateUIForErrorOccurence(_ error: Error) {
        showAlert = true
    
        if let apiError = error as? ApiError {
            errorDescription = apiError.description
        } else {
            errorDescription = error.localizedDescription
        }
    }

    // MARK: - API call private methods
    private func getTotalPages() {
        Task {
            do {
                totalPages = try await networkLayer
                    .getEpisodes()
                    .info
                    .pages
                
            } catch {
                updateUIForErrorOccurence(error)
            }
        }
    }
    
    // MARK: - API call public methods
    public func getEpisodes() {
        Task {
            do {
                let fetchedEpisodes = try await networkLayer
                    .getEpisodes(page: pagesCount)
                    .results
     
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.episodes.append(contentsOf: fetchedEpisodes)
                }
                
            } catch {
                updateUIForErrorOccurence(error)
            }
        }
    }
    
    public func loadMoreContent(currentItem item: Episode) {
        if ContentLoadingAnalyzer.shouldLoadMoreContent(
            of: episodes,
            item: item,
            currentPage: pagesCount,
            totalPages: totalPages
        ) {
            pagesCount += 1
            getEpisodes()
        }
    }
    
}
