//
//  MPINTextField.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 18/05/22.
//

import SwiftUI

struct MPINTextField: View {
    @State private var password: String = ""
    private let fieldHeight = Constants.Dimensions.mpin_field_height
    private let fieldWidth = Constants.Dimensions.mpin_field_width
    
    var body: some View {
        HStack {
            Spacer()
            lockIcon
            divider
            Group {
                secureField
                divider
                secureField
                divider
                secureField
                divider
                secureField
            }
            divider
            goBtn
            Spacer()
        }
        .background(.white)
    }
    
    var secureField: some View {
        SecureField("", text: $password)
            .padding()
            .background(.white)
    }
    
    var goBtn2: some View {
        Button(action: {
            print("Enter Pin action")
        }, label: {
            Image(systemName: "chevron.right")
        })
        .font(.system(size: 24))
        .foregroundColor(.black)
        .frame(minWidth: 28, maxHeight: Constants.Dimensions.mpin_field_height)
        .padding()
        .background(Color.yellow)
    }
    
    var goBtn: some View {
        Button {
            print("Go btn tapped")
        } label: {
            Image(systemName: "chevron.right")
                .resizable()
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.mpinSubmitBGColor)
//        .frame(width: fieldWidth - 10,
//               height: fieldHeight,
//               alignment: .center)
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: fieldHeight,
               alignment: .center)
    }
    
    var lockIcon: some View {
        Image(systemName: "lock.iphone")
            .resizable()
            .frame(width: fieldWidth - 15,
                   height: fieldHeight,
                   alignment: .center)
            .padding()
            .background(.white)
            .foregroundColor(.black)
    }
    
    var divider: some View {
        Divider()
            .frame(height: fieldHeight - 3, alignment: .center)
            .background(.gray)
    }
}

struct MPINTextField_Previews: PreviewProvider {
    static var previews: some View {
        MPINTextField()
    }
}
