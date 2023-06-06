//
//  CharactersList.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct CharactersView: View {
    @EnvironmentObject var charactersRouter: CharactersCoordinator.Router
    
    @State private var characters = [Character]()
    @State private var showAlert = false
    @State private var errorDescription = ""
    @State private var page = 1
    
    var body: some View {
        List(characters) { character in
            CharacterCell(character: character)
                .onTapGesture {
                    charactersRouter.route(to: \.detailScreen, character)
                }
            
            if (characters.isLastItem(character)) && (page.satisfiesMaxBound(for: .characters)){
                PagingLoadingView()
                    .onAppear {
                        page += 1
                        fetchCharacters()
                    }
            }
        }
        .onAppear { fetchCharacters() }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Ошибка ⚠️"),
                message: Text(errorDescription)
            )
        }
        
    }
    
    private func fetchCharacters()  {
        Task {
            do {
                let fetchedCharacters = try await NetworkLayer.shared.getCharacters(page: page).results
                characters.append(contentsOf: fetchedCharacters)
            } catch {
                showAlert = true
                
                if let error = error as? ApiError {
                    errorDescription = error.description
                } else {
                    errorDescription = error.localizedDescription
                }
            }
        }
    }
    
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
