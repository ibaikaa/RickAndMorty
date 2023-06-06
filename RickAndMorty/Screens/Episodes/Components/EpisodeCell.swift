//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct EpisodeCell: View {
    @State var episode: Episode
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(episode.name)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .font(.headline)

                Text(episode.episode)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(episode.airDate)
        }
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCell(episode: Episode(id: 20, name: "Look Who\'s Purging Now", airDate: "September 27, 2015", episode: "S02E09", created: "2017-11-10T12:56:35.772Z"))
    }
}
