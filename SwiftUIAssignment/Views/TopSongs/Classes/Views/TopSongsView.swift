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
            if viewModel.isLoading {
                ProgressView()
            } else {
                NavigationView {
                    albumList
                        .refreshable(action: {
                            getAlbums()
                        })
                        .navigationTitle("Stocks")
                }
            }
        }
        .onAppear {
            getAlbums()
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text("Alert"), message: Text(viewModel.networkError?.errorDescription() ?? "Some unknown error"), dismissButton: .cancel())
        }
//        .alert(item: $viewModel.networkError) { alertItem in
//            Alert(title: "Alert", message: alertItem.message, dismissButton: alertItem.dismissButton)
//        }
    }
    
    var albumList: some View {
        return List(viewModel.album.songs, id: \.id) { album in
            Text(album.name)
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

struct TopSongsView_Previews: PreviewProvider {
    static var previews: some View {
        TopSongsView()
//            .environment(\.colorScheme, .dark)
    }
}
