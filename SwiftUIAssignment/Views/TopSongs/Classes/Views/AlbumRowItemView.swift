//
//  AlbumRowItemView.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 25/05/22.
//

import SwiftUI

struct AlbumRowItemView: View {
    private let index: Int
    private let album: Result
    
    private let playBtnDimensions = 35.0
    
    init(index: Int, album: Result) {
        self.index = index
        self.album = album
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25,
                             style: .continuous)
            .fill(Color.clear)
            
            HStack(spacing: 15) {
                ZStack {
                    Circle()
                        .fill(Color.btnPlayBGColor)
                        .frame(maxWidth: playBtnDimensions, alignment: .center)
                        .shadow(color: Color.albumBGColor, radius: 10)
                    Text("\(index + 1)")
                        .font(.title3)
                        .foregroundColor(Color.albumTextColor)
                        
                }
                
                Group {
                    AlbumImageView(urlString: album.artworkUrl100)
                    Text("\(album.name)")
                        .lineLimit(2)
                        .font(.title3)
                        .foregroundColor(Color.albumTextColor)
                }
                
                Spacer()
                playButtonView
            }
        }
    }
    
    var playButtonView: some View {
        ZStack {
            Circle()
                .fill(Color.btnPlayBGColor)
                .frame(maxWidth: playBtnDimensions, alignment: .center)
                .shadow(color: Color.albumBGColor, radius: 10)
            Button {
                print("Button Play Tapped")
            } label: {
                Image(systemName: "play")
                    .foregroundColor(Color.albumTextColor)
                    .frame(width: playBtnDimensions, height: playBtnDimensions, alignment: .center)
            }
        }
        .padding()
    }
}


struct AlbumRowItemView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRowItemView(
            index: 1,
            album: Result(
                artistName: "Artist",
                id: "1",
                name: "Name",
                releaseDate: "",
                kind: "",
                artistID: "",
                artistURL: "",
                artworkUrl100: "https://is4-ssl.mzstatic.com/image/thumb/Music112/v4/7d/96/52/7d9652bc-a7c2-dab9-cdbd-6d7ef2d478fa/196589186973.jpg/100x100bb.jpg",
                genres: [],
                url: "",
                contentAdvisoryRating: ""
            )
        )
//            .environment(\.colorScheme, .dark)
    }
}
