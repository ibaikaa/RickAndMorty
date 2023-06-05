//
//  InfoRowView.swift
//  RickAndMorty
//
//  Created by ibaikaa on 5/6/23.
//

import SwiftUI

struct InfoRowView: View {
    @State var icon: String
    @State var label: String
    @State var data: String
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(label)
            Spacer()
            Text(data)
                .bold()
                .lineLimit(nil)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(icon: "hare", label: "Species", data: "Human")
    }
}
