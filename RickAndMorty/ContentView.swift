//
//  ContentView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 4/6/23.
//

import SwiftUI

struct ContentView: View { 
    var body: some View {
        MainTabCoordinator().view()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
