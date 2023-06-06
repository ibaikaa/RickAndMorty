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
    
    @ViewBuilder func makeStart() -> some View {
        EpisodesView()
    }
}
