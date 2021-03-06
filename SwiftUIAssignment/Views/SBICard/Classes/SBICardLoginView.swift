//
//  SBICardLoginView.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 18/05/22.
//

import SwiftUI

struct SBICardLoginView: View {
    private let buttonHeight = 40.0
    
    var body: some View {
        VStack(spacing: 0) {
            sbiLogoView
            userDetailsView
            YellowViews()
            versionView
        }
    }
    
    var sbiLogoView: some View {
        Image(Constants.Images.sbi_card_logo)
    }
    
    var userDetailsView: some View {
        UserDetailsView()
            .padding()
    }
    
    var versionView: some View {
        Text("Version Number: 7.3.15")
            .foregroundColor(.blueFontColor)
            .padding()
    }
}

struct SBICardLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SBICardLoginView()
    }
}
