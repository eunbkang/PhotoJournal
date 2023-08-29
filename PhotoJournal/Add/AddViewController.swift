//
//  AddViewController.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit

class AddViewController: BaseViewController {
    
    let addView = AddView()
    
    override func loadView() { // viewDidLoad보다 먼저 호출됨, super 메서드 호출 X
        self.view = addView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(observedSelectedImageNotification),
            name: NSNotification.Name("SelectedImage"),
            object: nil
        )
    }
    
    @objc func observedSelectedImageNotification(notification: NSNotification) {
        print(#function)
//        print(notification.userInfo?["name"])
//        print(notification.userInfo?["sample"])
        
        if let name = notification.userInfo?["name"] as? String {
            addView.photoImageView.image = UIImage(systemName: name)
        }
    }
    
    @objc func tappedSearchButton() {
        let words = ["Apple", "Banana", "Cookie", "Doll", "Egg"]
        
        NotificationCenter.default.post(name: NSNotification.Name("RecommendedKeyword"), object: nil, userInfo: ["keyword": words.randomElement()!])
        
        present(SearchViewController(), animated: true)
    }
    
    override func configViewComponents() {
        super.configViewComponents()
        
        print("Add configViewComponents")
        addView.searchButton.addTarget(self, action: #selector(tappedSearchButton), for: .touchUpInside)
    }
}

