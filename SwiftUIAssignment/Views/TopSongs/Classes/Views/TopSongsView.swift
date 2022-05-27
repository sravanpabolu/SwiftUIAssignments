//
//  TopSongsView.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import SwiftUI

struct TopSongsView: View {
    @ObservedObject var viewModel = AlbumListViewModel(client: NetworkClient())
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                progressView
            } else {
                resultsView
            }
        }
        .onAppear {
            getAlbums()
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text("Alert"), message: Text(viewModel.networkError?.errorDescription() ?? "Some unknown error"), dismissButton: .cancel())
        }
    }
    
    var resultsView: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.albumBGGradient1, .albumBGGradient2]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            if let albums = viewModel.album {
                AlbumsListView(songs: albums.songs)
                    .refreshable(action: {
                        getAlbums()
                    })
            } else {
                Text("Oops. unable to fetch albums")
                    .foregroundColor(.white)
            }
        }
        .navigationTitle("Top 50 Songs")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var progressView: some View {
        ZStack {
            Color.albumBGColor
                .ignoresSafeArea()
            ProgressView() {
                Text("Loading...")
                    .font(.caption2)
                    .foregroundColor(.white)
            }
            .progressViewStyle(.circular)
            .tint(.white)
            .scaleEffect(x: 3, y: 3, anchor: .center)
        }
    }
    
    var errorView: some View {
        Text("Oops. Unable to get albums")
            .font(.headline)
    }
    
    func getAlbums() {
        viewModel.getAlbums()
    }
}

struct AlbumsListView: View {
    let songs: [Result]
    
    var body: some View {
        List {
            ForEach(Array(zip(songs.indices, songs)), id: \.0) { index, album in
                AlbumRowItemView(index: index, album: album)
            }
            .listRowBackground(Color.clear)
        }
        .onAppear(perform: {
            UITableView.appearance().backgroundColor = UIColor(Color.clear)
        })
        .onDisappear(perform: {
            UITableView.appearance().backgroundColor = UIColor(Color.clear)
        })
        .navigationTitle("Top 50 Songs")
        .padding(.vertical)
    }
}

struct TopSongsView_Previews: PreviewProvider {
    static var previews: some View {
        TopSongsView()
//            .environment(\.colorScheme, .dark)
    }
}
