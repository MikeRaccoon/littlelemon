//
//  Functions.swift
//  Little Lemon
//
//  Created by Mike on 2/24/23.
//

import SwiftUI

func colorFromHex(_ hex: String) -> Color {
    var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if hexString.hasPrefix("#") {
        hexString.remove(at: hexString.startIndex)
    }

    if hexString.count != 6 {
        return Color.gray
    }

    var rgbValue: UInt64 = 0
    Scanner(string: hexString).scanHexInt64(&rgbValue)

    let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
    let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
    let blue = Double(rgbValue & 0x0000FF) / 255.0

    return Color(red: red, green: green, blue: blue)
}
