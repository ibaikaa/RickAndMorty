//
//  PagingLoadingView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct PagingLoadingView: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

struct PagingLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        PagingLoadingView()
    }
}
