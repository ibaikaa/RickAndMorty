//
//  EpisodeDetailedView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct EpisodeDetailedView: View {
    @State var episode: Episode
    var body: some View {
        NavigationStack {
            Form {
                Section("Info") {
                    InfoRowView(icon: "info", label: "Name", data: episode.name)
                    InfoRowView(icon: "calendar", label: "Air Date", data: episode.airDate)
                    InfoRowView(icon: "barcode", label: "Code", data: episode.episode)
                }
            }
            .navigationBarTitle(episode.name)
        }
    }
}

struct EpisodeDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailedView(episode: Episode(id: 20, name: "Look Who\'s Purging Now", airDate: "September 27, 2015", episode: "S02E09", created: "2017-11-10T12:56:35.772Z"))
    }
}
