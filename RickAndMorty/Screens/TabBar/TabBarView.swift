//
//  TabBarView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            CharactersListView()
                .tabItem {
                    Label("Characters", systemImage: "person.text.rectangle")
                }
            
            EpisodesList()
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
            
            LocationsList()
                .tabItem {
                    Label("Locations", systemImage: "map")
                }
        }
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
