//
//  SearchViewController.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit

class SearchViewController: BaseViewController {

    let searchView = SearchView()
    
    let imageList = ["pencil", "star", "person", "sun.max.fill", "moon.fill", "cloud.drizzle", "sparkles", "wind.snow", "snowflake", "thermometer.medium", "tornado", "paintbrush"]
    
    var delegate: PassSearchedImageDelegate?
    
    override func loadView() {
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 동작하지 않는 코드
        // addObserver보다 post가 먼저 신호를 보내면 받을 수 없음
        NotificationCenter.default.addObserver(self, selector: #selector(observedRecommendedKeywordNotification(notification:)), name: NSNotification.Name("RecommendedKeyword"), object: nil)
        
        searchView.searchBar.becomeFirstResponder()
        searchView.searchBar.delegate = self
    }
    
    @objc func observedRecommendedKeywordNotification(notification: NSNotification) {
        print(#function)
        
    }

    override func configViewComponents() {
        super.configViewComponents()
        
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(imageList[indexPath.item])
        
//        NotificationCenter.default.post(
//            name: .selectedImage,
//            object: nil,
//            userInfo: ["name": imageList[indexPath.item], "sample": "고래밥"]
//        )
        
        delegate?.receivedImage(imageName: imageList[indexPath.item])
        
        dismiss(animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchView.searchBar.resignFirstResponder()
    }
}
