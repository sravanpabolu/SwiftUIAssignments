//
//  ImageButton.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 20/05/22.
//

import SwiftUI

struct ImageButton {
    let title: String
    let image: String
    let btnAction: () -> Void
}

struct CustomButton: View {
    var btnTitle: String
    var btnImage: String
    var btnAction: () -> Void
    
    var body: some View {
        Button(action: btnAction) {
            VStack {
                Image(btnImage)
                    .resizable()
                    .frame(height: 50,
                           alignment: .top)
                Text(btnTitle)
                    .font(.system(size: 11))
                    .fontWeight(.bold)
                    .foregroundColor(Color.blueFontColor)
                    .frame(width: 100)
            }
        }
        .frame(width: Constants.Dimensions.mpin_field_width,
               height: Constants.Dimensions.mpin_field_height,
               alignment: .center)
    }
}
