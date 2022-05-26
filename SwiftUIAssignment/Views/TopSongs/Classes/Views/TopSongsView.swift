//
//  TopSongsView.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import SwiftUI

struct TopSongsView: View {
    @ObservedObject var viewModel = AlbumListViewModel(client: NetworkClient())
    
    var body: some View {
        ZStack {
            Color.albumRowBGColor
                .ignoresSafeArea()
            if viewModel.isLoading {
                progressView
            } else {
                NavigationView {
                    albumList
                }
            }
        }
        .onAppear {
            getAlbums()
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text("Alert"), message: Text(viewModel.networkError?.errorDescription() ?? "Some unknown error"), dismissButton: .cancel())
        }
    }
    
    var progressView: some View {
        ProgressView() {
            Text("Loading...")
                .font(.caption2)
                .foregroundColor(.white)
        }
        .progressViewStyle(.circular)
        .tint(.white)
        .scaleEffect(x: 3, y: 3, anchor: .center)
    }
    
    var albumList: some View {
        List {
            ForEach(Array(zip(viewModel.album.songs.indices, viewModel.album.songs)), id: \.0) { index, album in
                AlbumRowItemView(index: index, album: album)
            }
            .listRowBackground(Color.albumRowBGColor)
        }
        .refreshable(action: {
            getAlbums()
        })
        .navigationTitle("Top 50 Songs")
    }
    
    var errorView: some View {
        Text("Oops. Unable to get albums")
            .font(.headline)
    }
    
    func getAlbums() {
        viewModel.getAlbums()
    }
}

struct TopSongsView_Previews: PreviewProvider {
    static var previews: some View {
        TopSongsView()
//            .environment(\.colorScheme, .dark)
    }
}
