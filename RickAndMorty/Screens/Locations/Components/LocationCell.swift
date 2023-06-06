//
//  LocationCell.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct LocationCell: View {
    @State var location: Location
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text("\(location.residents.count) resident(s)")
                    .font(.subheadline)
            }
            Spacer()
            Text(location.dimension)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationCell(location: Location(id: 8, name: "Post-Apocalyptic Earth", type: "Planet", dimension: "Post-Apocalyptic Dimension", residents: ["https://rickandmortyapi.com/api/character/25", "https://rickandmortyapi.com/api/character/52", "https://rickandmortyapi.com/api/character/68", "https://rickandmortyapi.com/api/character/110", "https://rickandmortyapi.com/api/character/111", "https://rickandmortyapi.com/api/character/140", "https://rickandmortyapi.com/api/character/156", "https://rickandmortyapi.com/api/character/228", "https://rickandmortyapi.com/api/character/323", "https://rickandmortyapi.com/api/character/342"]))
    }
}
