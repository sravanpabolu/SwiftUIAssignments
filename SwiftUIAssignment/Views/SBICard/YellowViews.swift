//
//  YellowViews.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 20/05/22.
//

import SwiftUI

struct YellowViews: View {
    var body: some View {
        VStack {
            quickAccessView
            btnGetInTouch
            btnExplore
        }
    }
    
    var quickAccessView: some View {
        QuickAccessView()
    }
    
    var btnGetInTouch: some View {
        Button (Constants.Texts.get_in_touch) {
            print("Get in touch Button Tapped")
        }
        .buttonStyle(YellowButton())
    }
    
    var btnExplore: some View {
        Button(Constants.Texts.explore) {
            print("Explore Button Tapped")
        }
        .buttonStyle(YellowButton())
    }
}

struct YellowViews_Previews: PreviewProvider {
    static var previews: some View {
        YellowViews()
    }
}
