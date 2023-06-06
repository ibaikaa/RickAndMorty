//
//  LocationsCoordinator.swift
//  RickAndMorty
//
//  Created by ibaikaa on 6/6/23.
//

import Stinsen
import SwiftUI

final class LocationsCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \LocationsCoordinator.start)
    
    @Root var start = makeStart
    @Route(.modal) var detailScreen = makeDetailScreen
    
    @ViewBuilder func makeStart() -> some View {
        LocationsView()
            .navigationTitle("Locations")
    }
    
    @ViewBuilder func makeDetailScreen(location: Location) -> some View {
        LocationDetailedView(location: location)
    }
}
