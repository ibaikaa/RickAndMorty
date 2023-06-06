//
//  EpisodeDetailedView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct EpisodeDetailedView: View {
    @EnvironmentObject var episodeRouter: EpisodesCoordinator.Router
    
    @State var episode: Episode
    var body: some View {
        VStack {
            Button {
                episodeRouter.popToRoot()
            } label: {
                VStack {
                    Text("⬆️")
                    
                    Text("Go Back")
                        .foregroundColor(.white)

                }
                .font(.system(.title2,  weight: .black))
            }
            
            Form {
                Section("Info") {
                    InfoRowView(icon: "info", label: "Name", data: episode.name)
                    InfoRowView(icon: "calendar", label: "Air Date", data: episode.airDate)
                    InfoRowView(icon: "barcode", label: "Code", data: episode.episode)
                }
            }
        }
        .background(.yellow)
        
    }
}

struct EpisodeDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailedView(episode: Episode(id: 20, name: "Look Who\'s Purging Now", airDate: "September 27, 2015", episode: "S02E09", created: "2017-11-10T12:56:35.772Z"))
    }
}
