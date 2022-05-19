//
//  UserDetailsView.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 18/05/22.
//

import SwiftUI

struct UserDetailsView: View {
    @State private var defaultSelection = 1
    let mpinField = MPINTextField()
    
    var body: some View {
        VStack{
            greetingView
            
            Section {
                segmentControlView
                mpinField
                forgotView
            }
        }
        .background(Color.userDetailsAreaBGColor)
    }
    
    var greetingView: some View {
        let userName = "John Smith"
        return Text("Welcome \(userName.uppercased())")
                .bold()
                .padding()
    }
    
    var segmentControlView: some View {
        Picker("", selection: $defaultSelection) {
            Text(Constants.Texts.password).tag(0)
                .font(.subheadline)
                .foregroundColor(Color.fontColor)
            Text(Constants.Texts.mpin).tag(1)
            Text("")
        }
        .pickerStyle(.segmented)
        .background(Color.userDetailsAreaBGColor)
    }
    
    var forgotView: some View {
        HStack {
            Button {
                print("Unlock User")
            } label: {
                Text(Constants.Texts.unlock_user)
                    .foregroundColor(Color.fontColor)
            }
            
            Spacer()
            
            Button {
                print("Forgot Login Details")
            } label: {
                Text(Constants.Texts.forgot_login_det)
                    .foregroundColor(Color.fontColor)
            }
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView()
    }
}
