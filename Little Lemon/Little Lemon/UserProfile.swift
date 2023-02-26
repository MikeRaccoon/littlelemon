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
    @State private var phone = "(217) 555-0113"
    
    @State var checkOrder = true
    @State var checkPassword = true
    @State var checkOffers = true
    @State var checkNewsletters = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Personal information")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Avatar")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(colorFromHex("70718A"))
                    
                    HStack {
                        Image("profile-image-placeholder")
                            .resizable()
                            .frame(width: 95, height: 95)
                            .clipShape(Circle())
                        
                        Button("Change") {}
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                            .background(colorFromHex("394C45"))
                            .cornerRadius(7)
                            .padding(10)
                        
                        Button("Remove") {}
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .foregroundColor(colorFromHex("70718A"))
                            .border(colorFromHex("70718A"))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 15)
                    
                    Group {
                        Text("First Name")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(colorFromHex("70718A"))
                        
                        TextField("", text: $firstName)
                            .padding([.top, .bottom], 8)
                            .padding(.leading, 15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(colorFromHex("BBBCC8"), lineWidth: 1)
                            )
                        
                        Text("Last Name")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(colorFromHex("70718A"))
                        
                        TextField("", text: $lastName)
                            .padding([.top, .bottom], 8)
                            .padding(.leading, 15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(colorFromHex("BBBCC8"), lineWidth: 1)
                            )
                        
                        Text("Email")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(colorFromHex("70718A"))
                        
                        TextField("", text: $email)
                            .padding([.top, .bottom], 8)
                            .padding(.leading, 15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(colorFromHex("BBBCC8"), lineWidth: 1)
                            )
                        
                        Text("Phone Number")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(colorFromHex("70718A"))
                        
                        TextField("", text: $phone)
                            .padding([.top, .bottom], 8)
                            .padding(.leading, 15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(colorFromHex("BBBCC8"), lineWidth: 1)
                            )
                    }
                    
                    Text("Email notifications")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Group {
                        HStack{
                            Image(systemName: checkOrder ? "checkmark.square.fill" : "square")
                                .foregroundColor(checkOrder ? colorFromHex("394C45") : Color.secondary)
                            Text("Order statuses")
                                .foregroundColor(colorFromHex("333347"))
                        }
                        .padding(.vertical, 5)
                        .onTapGesture {
                            self.checkOrder.toggle()
                        }
                        
                        HStack{
                            Image(systemName: checkPassword ? "checkmark.square.fill" : "square")
                                .foregroundColor(checkPassword ? colorFromHex("394C45") : Color.secondary)
                            Text("Password changes")
                                .foregroundColor(colorFromHex("333347"))
                        }
                        .padding(.vertical, 5)
                        .onTapGesture {
                            self.checkPassword.toggle()
                        }
                        
                        HStack{
                            Image(systemName: checkOffers ? "checkmark.square.fill" : "square")
                                .foregroundColor(checkOffers ? colorFromHex("394C45") : Color.secondary)
                            Text("Special offers")
                                .foregroundColor(colorFromHex("333347"))
                        }
                        .padding(.vertical, 5)
                        .onTapGesture {
                            self.checkOffers.toggle()
                        }
                        
                        HStack{
                            Image(systemName: checkNewsletters ? "checkmark.square.fill" : "square")
                                .foregroundColor(checkNewsletters ? colorFromHex("394C45") : Color.secondary)
                            Text("Newsletter")
                                .foregroundColor(colorFromHex("333347"))
                        }
                        .padding(.vertical, 5)
                        .onTapGesture {
                            self.checkNewsletters.toggle()
                        }
                    }
                    
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Spacer()
                            
                            Text("Log out")
                                .foregroundColor(.black)
                                .padding([.top, .bottom], 8)
                            
                            Spacer()
                        }
                        .background(colorFromHex("F0C613"))
                        .cornerRadius(8)
                        .padding(.vertical, 20)
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button("Discard changes") {
                            firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
                            lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
                            email = UserDefaults.standard.string(forKey: kEmail) ?? ""
                        }
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .foregroundColor(colorFromHex("70718A"))
                        .border(colorFromHex("70718A"))
                        .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button("Save changes") {
                            if !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty,
                               isValidEmailFormat(email) {
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                                UserDefaults.standard.set(lastName, forKey: kLastName)
                                UserDefaults.standard.set(email, forKey: kEmail)
                                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            }
                        }
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(colorFromHex("394C45"))
                        .cornerRadius(7)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 20)
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
