//
//  MainTabCoordinator+Factory.swift
//  RickAndMorty
//
//  Created by ibaikaa on 6/6/23.
//

import SwiftUI
import Stinsen

extension MainTabCoordinator {
    func makeCharacters() -> CharactersCoordinator {
        CharactersCoordinator()
    }
    
    @ViewBuilder func makeCharactersTab(_ isActive: Bool) -> some View {
        Label("Characters", systemImage: "person.text.rectangle")
    }
    
    func makeEpisodes() -> EpisodesCoordinator {
        EpisodesCoordinator()
    }
    
    @ViewBuilder func makeEpisodesTab(_ isActive: Bool) -> some View {
        Label("Episodes", systemImage: "tv")
    }
    
    func makeLocations() -> LocationsCoordinator {
        LocationsCoordinator()
    }
    
    @ViewBuilder func makeLocationsTab(_ isActive: Bool) -> some View {
        Label("Locations", systemImage: "map")
    }
    
}
