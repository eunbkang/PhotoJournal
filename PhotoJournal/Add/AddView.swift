//
//  AddView.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit

class AddView: BaseView {
    
    let photoImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        
        return button
    }()
    
    override func configViewComponents() {
        addSubview(photoImageView)
        addSubview(searchButton)
    }
    
    override func configLayoutConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(photoImageView.snp.width).multipliedBy(0.75)
        }
        
        searchButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.trailing.equalTo(photoImageView)
        }
    }
}
