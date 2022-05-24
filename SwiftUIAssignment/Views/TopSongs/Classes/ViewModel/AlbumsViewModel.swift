//
//  AlbumsViewModel.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import Foundation
import Combine

class AlbumsViewModel {
    
    private let client: NetworkClient
    private var cancellable = Set<AnyCancellable>()
    private(set) var networkError: NetworkError?
    private(set) var album: Album?
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    func getAlbums() {
        do {
            try client.getData(for: .topSongs, type: Album.self)
                .sink(receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .failure(let error):
                        self?.networkError = NetworkError.custom(description: error.localizedDescription)
                    case .finished:
                        print("Finished")
                    }
                }, receiveValue: { [weak self] albumData in
                    print(albumData)
                    self?.album = albumData
                })
                .store(in: &cancellable)
        } catch let error as NetworkError {
            networkError = NetworkError.custom(description: error.localizedDescription)
        } catch {
            networkError = NetworkError.custom(description: error.localizedDescription)
        }
    }
}
