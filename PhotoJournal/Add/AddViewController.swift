//
//  AddViewController.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit

// Protocol 값 전달 1.
protocol PassDataDelegate {
    func receiveDate(date: Date)
}

protocol PassSearchedImageDelegate {
    func receivedImage(imageName: String)
}

class AddViewController: BaseViewController {
    
    let addView = AddView()
    
    override func loadView() { // viewDidLoad보다 먼저 호출됨, super 메서드 호출 X
        self.view = addView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewDidLoad 한번만 실행되므로 observer도 한번만 등록됨
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(observedSelectedImageNotification),
//            name: NSNotification.Name("SelectedImage"),
//            object: nil
//        )
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
        print(#function)
//        print(notification.userInfo?["name"])
//        print(notification.userInfo?["sample"])
        
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
        let words = ["Apple", "Banana", "Cookie", "Doll", "Egg"]
        
        NotificationCenter.default.post(name: NSNotification.Name("RecommendedKeyword"), object: nil, userInfo: ["keyword": words.randomElement()!])
        
        present(SearchViewController(), animated: true)
    }
    
    @objc func tappedSearchProtocolButton() {
        let vc = SearchViewController()
        
        vc.delegate = self
        
        present(vc, animated: true)
    }
    
    override func configViewComponents() {
        super.configViewComponents()
        
        print("Add configViewComponents")
        addView.searchButton.addTarget(self, action: #selector(tappedSearchButton), for: .touchUpInside)
        addView.searchProtocolButton.addTarget(self, action: #selector(tappedSearchProtocolButton), for: .touchUpInside)
        addView.dateButton.addTarget(self, action: #selector(tappedDateButton), for: .touchUpInside)
    }
}

// Protocol 값 전달 4.
extension AddViewController: PassDataDelegate {
    func receiveDate(date: Date) {
        addView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
    }
}

extension AddViewController: PassSearchedImageDelegate {
    func receivedImage(imageName: String) {
        addView.photoImageView.image = UIImage(systemName: imageName)
    }
}
