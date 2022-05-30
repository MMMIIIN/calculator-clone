import SwiftUI

extension Color {
    static let primaryColor = Color(hex: "#F1A33B")
    static let numberBackColor = Color(hex: "#333333")
    static let whiteColor = Color(hex: "#FFFFFF")
    static let grayColor = Color(hex: "#A5A5A5")
    static let blackColor = Color(hex: "#000000")
    

    init(hex: String) {
        let scanner = Scanner(string: hex)
        let _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
