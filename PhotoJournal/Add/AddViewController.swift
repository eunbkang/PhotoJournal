//
//  AddViewController.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit
import Kingfisher
import SeSACPhotoFramework

// Protocol 값 전달 1.
protocol PassDataDelegate {
    func receiveDate(date: Date)
}

protocol PassSearchedImageDelegate {
    func receivedImage(photo: Photo)
}

class AddViewController: BaseViewController {
    
    let addView = AddView()
    
    override func loadView() { // viewDidLoad보다 먼저 호출됨, super 메서드 호출 X
        self.view = addView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(observedSelectedImageNotification),
            name: .selectedImage,
            object: nil
        )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 이 앱에서 적절한 타이밍이 아닐 수 있지만 이렇게 제거
        NotificationCenter.default.removeObserver(self, name: .selectedImage, object: nil)
    }
    
    @objc func observedSelectedImageNotification(notification: NSNotification) {
        
        if let name = notification.userInfo?["name"] as? String {
            addView.photoImageView.image = UIImage(systemName: name)
        }
    }
    
    @objc func tappedDateButton() {
        let vc = DateViewController()
        
        // Protocol 값 전달 5.
        vc.delegate = self
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tappedSearchButton() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let gallery = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { _ in
            
        }
        let web = UIAlertAction(title: "웹에서 검색하기", style: .default) { _ in
            
            let vc = SearchViewController()
            vc.delegate = self
            
            self.present(vc, animated: true)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        for action in [gallery, web, cancel] {
            actionSheet.addAction(action)
        }
        
        present(actionSheet, animated: true)
    }
    
    @objc func tappedSearchProtocolButton() {
        let vc = SearchViewController()
        
        vc.delegate = self
        
        present(vc, animated: true)
    }
    
    @objc func tappedTitleButton() {
        let vc = TitleViewController()
        
        // Closure 값 전달 3.
        // tappedTitleButton 함수는 버튼 누르고 화면 이동하고 실행이 끝나지만
        // 클로저 안의 함수는 나중에 실행됨 -> 시점은 titleViewController에서 completionHandler 함수가 호출되는 시점
        vc.completionHandler = { text, age, push in
            self.addView.titleButton.setTitle(text, for: .normal)
            print("tappedTitleButton", age, push)
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tappedSubtitleButton() {
        let vc = ContentViewController()
        
        vc.completionHandler = { text in
            self.addView.contentButton.setTitle(text, for: .normal)
            print("tappedSubtitleButton")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func configViewComponents() {
        super.configViewComponents()
        
        print("Add configViewComponents")
        addView.searchButton.addTarget(self, action: #selector(tappedSearchButton), for: .touchUpInside)
        addView.searchProtocolButton.addTarget(self, action: #selector(tappedSearchProtocolButton), for: .touchUpInside)
        addView.dateButton.addTarget(self, action: #selector(tappedDateButton), for: .touchUpInside)
        addView.titleButton.addTarget(self, action: #selector(tappedTitleButton), for: .touchUpInside)
        addView.contentButton.addTarget(self, action: #selector(tappedSubtitleButton), for: .touchUpInside)
    }
}

// Protocol 값 전달 4.
extension AddViewController: PassDataDelegate {
    func receiveDate(date: Date) {
        addView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
    }
}

extension AddViewController: PassSearchedImageDelegate {
    func receivedImage(photo: Photo) {
        if let url = URL(string: photo.urls.small) {
            addView.photoImageView.kf.setImage(with: url)
        }
    }
}
