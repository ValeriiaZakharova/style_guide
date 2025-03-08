//
//  Font+Style.swift
//  style_guide
//
//  Created by Valeriia Zakharova on 02.03.2025.
//

import UIKit
import SwiftUI

// Project specific base font style sheet
extension Font {
    // Font weight 700
    static var kExtraBold28: Font {
        Font.custom("KaiseiTokumin-Bold", size: 28)
    }

    // Font weight 500
    static var kBolt20: Font {
        Font.custom("KaiseiTokumin-Medium", size: 20)
    }

    // Font weight 600
    static var pSemiBold16: Font {
        Font.custom("Poppins-SemiBold", size: 16)
    }

    // Font weight 500
    static var pMedium13: Font {
        Font.custom("Poppins-Medium", size: 13)
    }

    static var pMedium16: Font {
        Font.custom("Poppins-Medium", size: 16)
    }

    // Font weight 400
    static var pRegular12: Font {
        Font.custom("Poppins-Regular", size: 12)
    }

    static var pRegular13: Font {
        Font.custom("Poppins-Regular", size: 13)
    }

    static var pRegular14: Font {
        Font.custom("Poppins-Regular", size: 14)
    }

    static var pRegular16: Font {
        Font.custom("Poppins-Regular", size: 16)
    }

    // Font weight 300
    static var pLight14: Font {
        Font.custom("Poppins-Light", size: 14)
    }

    static var pLight13: Font {
        Font.custom("Poppins-Light", size: 13)
    }
}

extension UIFont {

    static var pRegular13: UIFont {
        UIFont(name: "Poppins-Regular", size: 13)!
    }

}
