//
//  Menu.swift
//  Little Lemon
//
//  Created by Mike on 2023-02-22.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("Description")
            List {}
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
