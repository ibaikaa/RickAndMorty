//
//  LocationDetailedView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct LocationDetailedView: View {
    @State var location: Location
    
    var body: some View {
        Form {
            Section("Info") {
                InfoRowView(icon: "info", label: "Name", data: location.name)
                InfoRowView(icon: "tornado", label: "Dimension", data: location.dimension)
                InfoRowView(icon: "globe.europe.africa.fill", label: "Type", data: location.type)
            }
        }
    }
    
}

struct LocationDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailedView(location: Location(id: 1, name: "Earth", type: "Planet", dimension: "???", residents: []))
    }
}
