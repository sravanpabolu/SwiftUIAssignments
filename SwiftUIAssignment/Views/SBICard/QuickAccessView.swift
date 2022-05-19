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
//    private let buttonImgWidth = 60.0
//    private let buttonImgHeight = 80.0
    private let buttonTextWidth = 100.0
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
        VStack {
            Button {
                print("Card Pay button tapped")
            } label: {
                VStack {
                    Image(Constants.Images.card_pay)
                        .resizable()
                    Text(Constants.Texts.card_pay)
                        .font(.system(size: fontSize))
                        .fontWeight(.bold)
                        .foregroundColor(Color.fontColor)
                        .frame(width: buttonTextWidth)
                }
            }
        }
        .frame(width: buttonWidth,
               height: buttonHeight,
               alignment: .center)
    }
    
    var btnQRPay: some View {
        VStack {
            Button {
                print("Scan to Pay button tapped")
            } label: {
                VStack {
                    Image(Constants.Images.bharath_qr_logo)
                        .resizable()
                    Text(Constants.Texts.scan_pay)
                        .font(.system(size: fontSize))
                        .fontWeight(.bold)
                        .foregroundColor(Color.fontColor)
                        .frame(width: buttonTextWidth)
                }
            }
        }
        .frame(width: buttonWidth,
               height: buttonHeight,
               alignment: .center)
    }
    
    var btnOffers: some View {
        VStack {
            Button {
                print("Offers near you button tapped")
            } label: {
                VStack {
                    Image(Constants.Images.offers_near_me)
                        .resizable()
                    Text(Constants.Texts.offer_near_you)
                        .font(.system(size: fontSize))
                        .fontWeight(.bold)
                        .foregroundColor(Color.fontColor)
                        .frame(width: buttonTextWidth)
                }
            }
        }
        .frame(width: buttonWidth,
               height: buttonHeight,
               alignment: .center)
    }
}

struct QuickAccessView_Previews: PreviewProvider {
    static var previews: some View {
        QuickAccessView()
    }
}
