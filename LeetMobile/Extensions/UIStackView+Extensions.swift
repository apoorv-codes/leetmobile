//
//  UIStackView+Extensions.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 1/4/25.
//
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
