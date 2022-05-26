//
//  AlbumsViewModel.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import Foundation
import Combine

class AlbumListViewModel: ObservableObject {
    
    private let client: NetworkClient
    private var cancellable = Set<AnyCancellable>()
    private(set) var networkError: DataFetchError?
    
    @Published var isLoading = false
    @Published var hasError = false
    @Published private(set) var album: AlbumViewModel = AlbumViewModel(album: Album.init(feed: Feed(title: "", id: "", author: Author(name: "", url: ""), links: [], copyright: "", country: "", icon: "", updated: "", results: [])))
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    func getAlbums() {
        do {
            isLoading = true
            try client.getData(for: .topSongs, type: Album.self)
                .sink(receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    switch completion {
                    case .failure(let error):
                        self?.hasError = true
                        self?.networkError = DataFetchError.custom(description: error.localizedDescription)
                    case .finished:
                        print("Finished")
                    }
                }, receiveValue: { [weak self] albumData in
                    self?.hasError = false
                    self?.album = AlbumViewModel.init(album: albumData)
                })
                .store(in: &cancellable)
        } catch let error as DataFetchError {
            isLoading = false
            hasError = true
            networkError = DataFetchError.custom(description: error.localizedDescription)
        } catch {
            isLoading = false
            hasError = true
            networkError = DataFetchError.custom(description: error.localizedDescription)
        }
    }
}
