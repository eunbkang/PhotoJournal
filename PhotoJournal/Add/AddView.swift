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
    
    let searchProtocolButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        
        return button
    }()
    
    let dateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle(DateFormatter.today(), for: .normal)
        
        return button
    }()
    
    override func configViewComponents() {
        addSubview(photoImageView)
        addSubview(searchButton)
        addSubview(searchProtocolButton)
        addSubview(dateButton)
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
        
        searchProtocolButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.leading.bottom.equalTo(photoImageView)
        }
        
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(photoImageView)
            make.height.equalTo(48)
        }
    }
}
