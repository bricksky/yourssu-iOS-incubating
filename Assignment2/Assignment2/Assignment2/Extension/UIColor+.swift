//
//  UIColor+.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/12.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {

    class var mainGray: UIColor {
        return UIColor(r: 96, g: 96, b: 96)
    }
    class var memoGray: UIColor {
        return UIColor(r: 156, g: 156, b: 156)
    }
    class var borderGray: UIColor {
        return UIColor(r: 171, g: 171, b: 171)
    }
    class var textGray: UIColor {
        return UIColor(r: 186, g: 186, b: 186)
    }
    class var backgroundGray: UIColor {
        return UIColor(r: 243, g: 243, b: 243)
    }
}
