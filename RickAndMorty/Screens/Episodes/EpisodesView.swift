//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct EpisodesView: View {
    @EnvironmentObject var episodesRouter: EpisodesCoordinator.Router
    @ObservedObject var viewModel = EpisodesViewModel()
    
    var body: some View {
        List(viewModel.episodes) { episode in
            EpisodeCell(episode: episode)
                .onAppear {
                    viewModel.loadMoreContent(currentItem: episode)
                }
                .onTapGesture {
                    episodesRouter.route(to: \.detailScreen, episode)
                }
        }
        .onAppear { viewModel.getEpisodes() }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Ошибка ⚠️"),
                message: Text(viewModel.errorDescription)
            )
        }
    }
        
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
    }
}
