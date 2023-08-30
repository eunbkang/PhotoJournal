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
    
    let titleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("오늘의 사진", for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    let contentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.setTitle("사진 설명", for: .normal)
        button.tintColor = .white
        
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
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(photoImageView.snp.width).multipliedBy(0.7)
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
        
        titleButton.snp.makeConstraints { make in
            make.top.equalTo(dateButton.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(photoImageView)
            make.height.equalTo(dateButton)
        }
        
        contentButton.snp.makeConstraints { make in
            make.top.equalTo(titleButton.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(photoImageView)
            make.height.equalTo(150)
        }
    }
}
