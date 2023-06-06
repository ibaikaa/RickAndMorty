//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by ibaikaa on 6/6/23.
//

import Stinsen
import SwiftUI

final class EpisodesCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \EpisodesCoordinator.start)
    
    @Root var start = makeStart
    @Route(.fullScreen) var detailScreen = makeDetailScreen
    
    @ViewBuilder func makeStart() -> some View {
        EpisodesView()
            .navigationTitle("Episodes")
    }
    
    @ViewBuilder func makeDetailScreen(episode: Episode) -> some View {
        EpisodeDetailedView(episode: episode)
            .navigationTitle(episode.name)
    }
}
