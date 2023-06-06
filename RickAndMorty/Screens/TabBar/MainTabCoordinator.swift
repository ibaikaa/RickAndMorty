//
//  MainTabCoordinator.swift
//  RickAndMorty
//
//  Created by ibaikaa on 6/6/23.
//

import Stinsen
import SwiftUI

final class MainTabCoordinator: TabCoordinatable {
    var child = TabChild(
        startingItems: [
            \MainTabCoordinator.characters,
            \MainTabCoordinator.episodes,
            \MainTabCoordinator.locations
        ]
    )
    
    @Route(tabItem: makeCharactersTab, onTapped: onCharactersTapped) var characters = makeCharacters
    @Route(tabItem: makeEpisodesTab, onTapped: onEpisodesTapped) var episodes = makeEpisodes
    @Route(tabItem: makeLocationsTab, onTapped: onLocationsTapped) var locations = makeLocations
    
}
