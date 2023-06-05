//
//  EpisodesList.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct EpisodesList: View {
    @State private var episodes = [Episode]()
    @State private var showAlert = false
    @State private var errorDescription = ""
    
    @State private var page = 1
    var body: some View {
        NavigationStack {
            List(episodes) { episode in
                NavigationLink(destination: EpisodeDetailedView(episode: episode)) {
                    EpisodeCell(episode: episode)
                }
                
                if episodes.isLastItem(episode) && page.satisfiesMaxBound(for: .episodes) {
                    PagingLoadingView()
                        .onAppear {
                            page += 1
                            fetchEpisodes()
                        }
                }
            }
            .navigationBarTitle("Episodes")
        }
        .onAppear { fetchEpisodes() }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Ошибка ⚠️"),
                message: Text(errorDescription)
            )
        }
    }
    
    func fetchEpisodes() {
        Task {
            do {
                let fetchedEpisodes = try await NetworkLayer.shared.getEpisodes(page: page).results
                episodes.append(contentsOf: fetchedEpisodes)
            } catch {
                showAlert = true
                
                if let error = error as? ApiError {
                    errorDescription = error.description
                } else {
                    errorDescription = error.localizedDescription
                }
            }
        }
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesList()
    }
}
