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
            quickAccessView
            btnGetInTouch
            Divider()
                .background(.gray)
            btnExplore
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
    
    var quickAccessView: some View {
        QuickAccessView()
            .padding()
    }
    
    var btnGetInTouch: some View {
        Button {
            print("Get in touch Button Tapped")
        } label: {
            Text(Constants.Texts.get_in_touch)
                .foregroundColor(.black)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: buttonHeight,
                    alignment: .center)
                .padding()
                .background(Color.btnBGColor)
                .foregroundColor(Color.btnBGColor)
        }
    }
    
    var btnExplore: some View {
        Button {
            print("Explore Button Tapped")
        } label: {
            Text(Constants.Texts.explore)
                .foregroundColor(.black)
            .frame(
                width: UIScreen.main.bounds.width,
                height: buttonHeight,
                alignment: .center)
            .padding()
            .background(Color.btnBGColor)
            .foregroundColor(Color.btnBGColor)
        }
    }
    
    var versionView: some View {
        Text("Version Number: 7.3.15")
            .foregroundColor(.fontColor)
            .padding()
    }
}

struct SBICardLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SBICardLoginView()
    }
}
