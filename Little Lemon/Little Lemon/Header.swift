//
//  Header.swift
//  Little Lemon
//
//  Created by Mike on 2/24/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                
                Image("profile-image-placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .padding(.trailing, 20)
            }
            
            Image("Logo")
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
