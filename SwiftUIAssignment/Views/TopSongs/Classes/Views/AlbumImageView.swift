//
//  AlbumImage.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 25/05/22.
//

import SwiftUI

struct AlbumImageView: View {
    let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        AsyncImage(
            url: URL(string: urlString),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 50, maxHeight: 50)
                    .cornerRadius(15)
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}

struct AlbumImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        AlbumImageView(urlString: "https://is4-ssl.mzstatic.com/image/thumb/Music112/v4/7d/96/52/7d9652bc-a7c2-dab9-cdbd-6d7ef2d478fa/196589186973.jpg/100x100bb.jpg")
    }
}
