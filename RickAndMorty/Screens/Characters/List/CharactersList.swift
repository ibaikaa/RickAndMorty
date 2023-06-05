//
//  CharactersList.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct CharactersListView: View {
    @State private var characters = [Character]()
    @State private var showAlert = false
    @State private var errorDescription = ""
    @State private var page = 1
    
    var body: some View {
        NavigationStack {
            List(characters) { character in
                
                NavigationLink(destination: CharacterDetailedView(character: character)) {
                    CharacterCell(character: character)
                }
                
                if (characters.isLastItem(character)) && page.satisfiesMaxBound(for: .characters) {
                    PagingLoadingView()
                        .onAppear {
                            page += 1
                            fetchCharacters()
                        }
                }
                
            }
            .navigationBarTitle("Characters")
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
        CharactersListView()
    }
}
