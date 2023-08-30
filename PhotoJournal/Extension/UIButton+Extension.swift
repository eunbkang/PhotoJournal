//
//  UIButton+Extension.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/30.
//

import UIKit

extension UIButton {
    func configButton(title: String?, image: String?, imageSize: CGFloat = 15, backgroundColor: UIColor = .white, foregroundColor: UIColor = .black) {
        var config = UIButton.Configuration.plain()
        
        if let title {
            var titleAttr = AttributedString.init(title)
            titleAttr.font = .preferredFont(forTextStyle: .subheadline)
            
            config.attributedTitle = titleAttr
        }
        
        if let image {
            config.image = UIImage(systemName: image, withConfiguration: UIImage.SymbolConfiguration(pointSize: imageSize))
            config.imagePlacement = .top
            config.imagePadding = 16
        }
        
        config.baseForegroundColor = foregroundColor
        config.background.backgroundColor = backgroundColor
        config.cornerStyle = .fixed
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        self.configuration = config
    }
}
