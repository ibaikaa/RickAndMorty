//
//  LocationsView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct LocationsView: View {
    @State private var locations = [Location]()
    @State private var showAlert = false
    @State private var errorDescription = ""
    
    @State private var page = 1
    var body: some View {
        NavigationStack {
            List(locations) { location in
                NavigationLink(destination: LocationDetailedView(location: location)) {
                    LocationCell(location: location)
                }
                
                if locations.isLastItem(location) && page.satisfiesMaxBound(for: .locations) {
                    PagingLoadingView()
                        .onAppear {
                            page += 1
                            fetchLocations()
                        }
                }
            }
            .navigationBarTitle("Locations")
            .listStyle(.sidebar)
        }
        .onAppear { fetchLocations() }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Ошибка ⚠️"),
                message: Text(errorDescription)
            )
        }
    }
    
    func fetchLocations() {
        Task {
            do {
                let fetchedLocations = try await NetworkLayer.shared.getLocations(page: page).results
                locations.append(contentsOf: fetchedLocations)
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

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
