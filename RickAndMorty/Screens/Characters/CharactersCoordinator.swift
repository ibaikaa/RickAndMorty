//
//  CharactersCoordinator.swift
//  RickAndMorty
//
//  Created by ibaikaa on 6/6/23.
//

import Stinsen
import SwiftUI

final class CharactersCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \CharactersCoordinator.start)
    
    @Root var start = makeStart
    @Route(.push) var detailScreen = makeDetailScreen
    
    @ViewBuilder func makeStart() -> some View {
        CharactersView()
            .navigationTitle("Characters")
    }
    
    @ViewBuilder func makeDetailScreen(character: Character) -> some View {
        CharacterDetailedView(character: character)
            .navigationTitle(character.name)
    }
    
}
