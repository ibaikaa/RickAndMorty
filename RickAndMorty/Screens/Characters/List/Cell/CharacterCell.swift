//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct CharacterCell: View {
    @State var character: Character
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)! ) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .cornerRadius(100)

            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                
                Text("\(character.episode.count) episode(s)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()

        }
        .padding(.horizontal)
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailedView(character: Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", type: "", gender: "Male", origin:  RickAndMorty.CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), location: RickAndMorty.CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: [ "https://rickandmortyapi.com/api/episode/51"], created: "2017-11-04T18:50:21.651Z")
)
    }
}
