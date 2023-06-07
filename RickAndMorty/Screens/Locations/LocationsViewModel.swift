//
//  LocationsViewModel.swift
//  RickAndMorty
//
//  Created by ibaikaa on 7/6/23.
//

import SwiftUI

final class LocationsViewModel: ObservableObject {
    
    // MARK: - Published properties
    @Published var locations: [Location] = []
    @Published var showAlert = false
    @Published var errorDescription = ""
    
    // MARK: - Private properties
    private let networkLayer = NetworkLayer.shared
    private var pagesCount: Int = 1
    private var totalPages = 0
    
    // MARK: - Init() method
    init() { fetchTotalPages() }
    
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
    private func fetchTotalPages() {
        Task {
            do {
                totalPages = try await networkLayer
                    .getCharacters()
                    .info
                    .pages
                
            } catch {
                updateUIForErrorOccurence(error)
            }
        }
    }
    
    // MARK: - API call public methods
    public func fetchLocations() {
        Task {
            do {
                let fetchedLocations = try await networkLayer
                    .getLocations(page: pagesCount)
                    .results
     
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.locations.append(contentsOf: fetchedLocations)
                }
                
            } catch {
                updateUIForErrorOccurence(error)
            }
        }
    }
    
    public func loadMoreContent(currentItem item: Location) {
        if ContentLoadingAnalyzer.shouldLoadMoreContent(
            of: locations,
            item: item,
            currentPage: pagesCount,
            totalPages: totalPages
        ) {
            pagesCount += 1
            fetchLocations()
        }
    }
    
}
