//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Mike on 2/22/23.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State private var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State private var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    var body: some View {
        VStack {
            Text("Personal information")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
            
            Group {
                HStack {
                    Text("First Name")
                    Spacer()
                }
                
                TextField("", text: $firstName)
                    .padding([.top, .bottom], 8)
                    .padding(.leading, 15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 1)
                    )
                
                HStack {
                    Text("Last Name")
                    Spacer()
                }
                
                TextField("", text: $lastName)
                    .padding([.top, .bottom], 8)
                    .padding(.leading, 15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 1)
                    )
                
                HStack {
                    Text("Email")
                    Spacer()
                }
                
                TextField("", text: $email)
                    .padding([.top, .bottom], 8)
                    .padding(.leading, 15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
            .padding([.leading, .trailing], 20)
            
            Button(action: {
                if !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty,
                   isValidEmailFormat(email) {
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                    UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                }
            }) {
                HStack {
                    Spacer()
                    Text("Save user details")
                        .foregroundColor(.white)
                        .padding([.top, .bottom], 8)
                   
                    Spacer()
                }
                .background(colorFromHex("394C45"))
                .cornerRadius(8)
                .padding([.leading, .trailing], 20)
                .padding(.top, 10)
            }
            
            Spacer()
            
            Button(action: {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }) {
                HStack {
                    Spacer()
                    
                    Text("Log out")
                        .foregroundColor(colorFromHex("394C45"))
                        .padding([.top, .bottom], 8)
                    
                    Spacer()
                }
                .background(colorFromHex("F0C613"))
                .cornerRadius(8)
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 20)
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
