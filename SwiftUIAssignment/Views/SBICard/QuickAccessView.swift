//
//  QuickAccessView.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 18/05/22.
//

import SwiftUI

struct QuickAccessView: View {
    
    private let buttonWidth = 50.0
    private let buttonHeight = 70.0
    fileprivate let buttonTextWidth = 100.0
    private let fontSize = 11.0
    
    var body: some View {
        VStack {
            titleView
            HStack {
                btnCardPay
                divider
                btnQRPay
                divider
                btnOffers
            }
        }
        .background(.green)
    }
    
    var titleView: some View {
        Text(Constants.Texts.quick_access)
            .font(.title3)
    }
    
    var divider: some View {
        Divider()
            .frame(height: buttonHeight - 3, alignment: .center)
            .background(.gray)
            .padding()
    }
    
    var btnCardPay: some View {
        CustomButton(btnTitle: Constants.Texts.card_pay, btnImage: Constants.Images.card_pay) {
            print("Card Pay button tapped")
        }
    }
    
    var btnQRPay: some View {
        CustomButton(btnTitle: Constants.Texts.scan_pay, btnImage: Constants.Images.bharath_qr_logo) {
            print("Scan to Pay button tapped")
        }
    }
    
    var btnOffers: some View {
        CustomButton(btnTitle: Constants.Texts.offer_near_you, btnImage: Constants.Images.offers_near_me) {
            print("Offers near you button tapped")
        }
    }
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

struct QuickAccessView_Previews: PreviewProvider {
    static var previews: some View {
        QuickAccessView()
    }
}
