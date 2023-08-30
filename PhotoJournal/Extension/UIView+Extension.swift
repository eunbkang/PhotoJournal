//
//  UIView+Extension.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/30.
//

import UIKit

extension UIView {
    func configShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.masksToBounds = false
    }
}
