//
//  UIView+.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/12.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
         views.forEach { self.addSubview($0) }
     }
}
