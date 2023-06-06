//
//  CharacterDetailedView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct CharacterDetailedView: View {
    @State var character: Character
    var body: some View {
        Form {
            Section("MUGSHOT") {
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string: character.image)!) { image in
                        image
                            .resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                    Spacer()
                }
            }
            
            Section("INFO") {
                InfoRowView(icon: "hare", label: "Species", data: character.species)
                InfoRowView(icon: "eyes", label: "Gender", data: character.gender)
                InfoRowView(icon: "waveform.path.ecg.rectangle", label: "Status", data: character.status)
                InfoRowView(icon: "map", label: "Location", data: character.location.name)
                InfoRowView(icon: "paperplane", label: "Origin", data: character.origin.name)
                InfoRowView(icon: "tv", label: "Episodes", data: "\(character.episode.count)")
            }
        }
    }
    
}

struct CharacterDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailedView(character: Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", type: "", gender: "Male", origin:  RickAndMorty.CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), location: RickAndMorty.CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: [ "https://rickandmortyapi.com/api/episode/51"], created: "2017-11-04T18:50:21.651Z")
        )
    }
}
