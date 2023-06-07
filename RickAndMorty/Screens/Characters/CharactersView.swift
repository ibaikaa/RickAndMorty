//
//  CharactersList.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct CharactersView: View {
    @EnvironmentObject var charactersRouter: CharactersCoordinator.Router
    
    @ObservedObject var viewModel = CharactersViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.characters) { character in
                CharacterCell(character: character)
                .onAppear {
                    viewModel.loadMoreContent(currentItem: character)
                }
                .onTapGesture {
                    charactersRouter.route(to: \.detailScreen, character)
                }
            }
 
        }
        .onAppear { viewModel.fetchCharacters() }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Ошибка ⚠️"),
                message: Text(viewModel.errorDescription)
            )
        }
    }
    
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
