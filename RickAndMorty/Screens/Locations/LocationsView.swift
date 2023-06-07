//
//  LocationsView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var locationsRouter: LocationsCoordinator.Router
    @ObservedObject var viewModel = LocationsViewModel()
    
    var body: some View {
        List(viewModel.locations) { location in
            LocationCell(location: location)
            .onAppear {
                viewModel.loadMoreContent(currentItem: location)
            }
            .onTapGesture {
                locationsRouter.route(to: \.detailScreen, location)
            }
        }
        .onAppear { viewModel.fetchLocations() }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Ошибка ⚠️"),
                message: Text(viewModel.errorDescription)
            )
        }
    }
    
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
