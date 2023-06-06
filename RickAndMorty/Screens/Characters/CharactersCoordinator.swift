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
    
    @ViewBuilder func makeStart() -> some View {
        CharactersView()
    }
}
