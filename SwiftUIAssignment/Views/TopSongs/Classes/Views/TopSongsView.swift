//
//  TopSongsView.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import SwiftUI

struct TopSongsView: View {
    let viewModel = AlbumsViewModel(client: NetworkClient())
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            viewModel.getAlbums()
        }
    }
}

struct TopSongsView_Previews: PreviewProvider {
    static var previews: some View {
        TopSongsView()
    }
}
