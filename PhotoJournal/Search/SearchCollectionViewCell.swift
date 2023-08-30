//
//  SearchCollectionViewCell.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit
import Kingfisher

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override func configViewComponents() {
        contentView.addSubview(imageView)
    }
    
    override func configLayoutConstraints() {
        imageView.snp.makeConstraints { make in
            make.verticalEdges.horizontalEdges.equalToSuperview()
        }
    }
    
    func setDataToView(photo: Photo) {
        if let url = URL(string: photo.urls.smallS3) {
            imageView.kf.setImage(with: url)
        }
    }
}
