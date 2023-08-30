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
        view.backgroundColor = .systemGray6
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        
        return view
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.configButton(title: nil, image: "photo", imageSize: 17)
        button.configShadow()
        
        return button
    }()
    
    let searchProtocolButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        
        return button
    }()
    
    let dateButton: UIButton = {
        let button = UIButton()
        button.configButton(title: DateFormatter.today(), image: nil)
        button.configShadow()
        
        return button
    }()
    
    let titleButton: UIButton = {
        let button = UIButton()
        button.configButton(title: "제목", image: nil)
        button.configShadow()
        
        return button
    }()
    
    let contentButton: UIButton = {
        let button = UIButton()
        button.configButton(title: "내용", image: nil)
        button.configShadow()
        
        return button
    }()
    
    override func configViewComponents() {
        addSubview(photoImageView)
        addSubview(searchButton)
        addSubview(searchProtocolButton)
        addSubview(dateButton)
        addSubview(titleButton)
        addSubview(contentButton)
    }
    
    override func configLayoutConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(photoImageView.snp.width).multipliedBy(0.7)
        }
        
        searchButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.trailing.equalTo(photoImageView).inset(8)
        }
        
        searchProtocolButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.leading.bottom.equalTo(photoImageView).inset(8)
        }
        
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
        }
        
        titleButton.snp.makeConstraints { make in
            make.top.equalTo(dateButton.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(dateButton)
            make.height.equalTo(dateButton)
        }
        
        contentButton.snp.makeConstraints { make in
            make.top.equalTo(titleButton.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(dateButton)
            make.height.equalTo(150)
        }
    }
}
