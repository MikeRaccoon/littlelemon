//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Mike on 2023-02-22.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Image("Logo")
                
              //  Spacer()
                
                VStack {
                    HStack {
                        Text("Little Lemon")
                            .foregroundColor(colorFromHex("F0C613"))
                            .font(.system(size: 40))
                        Spacer()
                    }
                   
                    HStack {
                        Text("Chicago")
                            .foregroundColor(.white)
                            .font(.system(size: 26))
                        Spacer()
                    }
                    
                    HStack {
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .frame(height: 100)
                        
                        Spacer()
                        
                        Image("Hero image")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .offset(y: -15)
                    }
                    .offset(y: -25)
                }
                .padding([.leading, .trailing], 20)
                .padding(.top, 10)
                .padding(.bottom, 5)
                .background(colorFromHex("394C45"))
                
                Group {
                    TextField("First name", text: $firstName)
                        .padding([.top, .bottom], 8)
                        .padding(.leading, 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray, lineWidth: 1)
                        )
                    
                    TextField("Last name", text: $lastName)
                        .padding([.top, .bottom], 8)
                        .padding(.leading, 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray, lineWidth: 1)
                        )
                    
                    TextField("Email", text: $email)
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
                        isLoggedIn = true
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Register")
                            .foregroundColor(.white)
                            .padding([.top, .bottom], 8)
                       
                        Spacer()
                    }
                    .background(colorFromHex("394C45"))
                    .cornerRadius(8)
                    .padding([.leading, .trailing], 20)
                }
                
                Spacer()
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
