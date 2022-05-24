//
//  QuickAccessButton.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 18/05/22.
//

import SwiftUI

struct YellowButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.black)
            .frame(
                width: UIScreen.main.bounds.width,
                height: Constants.Dimensions.get_in_touch_btn_height,
                alignment: .center)
            .padding()
            .background(Color.btnBGColor)
            .foregroundColor(Color.btnBGColor)
    }
}

