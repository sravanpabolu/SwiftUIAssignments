//
//  AlbumViewModel.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 25/05/22.
//

import Foundation

struct AlbumViewModel {
    private var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    var title: String {
        album.feed.title
    }
    
    var songs: [Result] {
        album.feed.results
    }
}
