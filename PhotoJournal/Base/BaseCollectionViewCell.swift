//
//  BaseCollectionViewCell.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViewComponents()
        configLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViewComponents() { }
    
    func configLayoutConstraints() { }
}
