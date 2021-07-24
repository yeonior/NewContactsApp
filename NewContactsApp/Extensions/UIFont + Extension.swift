//
//  UIFont + Extension.swift
//  NewContactsApp
//
//  Created by ruslan on 24.07.2021.
//

import UIKit

extension UIFont {
    
    enum RoundedWeight {
        case regular
        case medium
        case semibold
    }
    
    static func sfProRounded(ofSize size: CGFloat, weight: RoundedWeight) -> UIFont? {
        
        switch weight {
        
        case .regular:
            return UIFont(name: "SFProRounded-Regular", size: size)
        case .medium:
            return UIFont(name: "SFProRounded-Medium", size: size)
        case .semibold:
            return UIFont(name: "SFProRounded-Semibold", size: size)
        }
    }
}
