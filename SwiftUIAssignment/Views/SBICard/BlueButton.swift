//
//  BlueButton.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 20/05/22.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(Color.blueFontColor)
    }
}
