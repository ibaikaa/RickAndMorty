//
//  MainTabCoordinator+Factory.swift
//  RickAndMorty
//
//  Created by ibaikaa on 6/6/23.
//

import SwiftUI
import Stinsen

/// Extension for creatings views for MainTabCoordinator
extension MainTabCoordinator {
    
    // MARK: - Characters
    func makeCharacters() -> NavigationViewCoordinator<CharactersCoordinator> {
        NavigationViewCoordinator(CharactersCoordinator())
    }
    
    @ViewBuilder func makeCharactersTab(_ isActive: Bool) -> some View {
        Label("Characters", systemImage: "person.text.rectangle")
    }
    
    func onCharactersTapped(_ isRepeat: Bool, coordinator: NavigationViewCoordinator<CharactersCoordinator>) {
        if isRepeat { coordinator.child.popToRoot() }
    }
    
    // MARK: - Episodes
    func makeEpisodes() -> NavigationViewCoordinator<EpisodesCoordinator> {
        NavigationViewCoordinator(EpisodesCoordinator())
    }
    
    @ViewBuilder func makeEpisodesTab(_ isActive: Bool) -> some View {
        Label("Episodes", systemImage: "tv")
    }
    
    func onEpisodesTapped(_ isRepeat: Bool, coordinator: NavigationViewCoordinator<EpisodesCoordinator>) {
        if isRepeat { coordinator.child.popToRoot() }
    }
    
    // MARK: - Locations
    func makeLocations() -> NavigationViewCoordinator<LocationsCoordinator> {
        NavigationViewCoordinator(LocationsCoordinator())
    }
    
    @ViewBuilder func makeLocationsTab(_ isActive: Bool) -> some View {
        Label("Locations", systemImage: "map")
    }
    
    func onLocationsTapped(_ isRepeat: Bool, coordinator: NavigationViewCoordinator<LocationsCoordinator>) {
        if isRepeat { coordinator.child.popToRoot() }
    }
    
}
