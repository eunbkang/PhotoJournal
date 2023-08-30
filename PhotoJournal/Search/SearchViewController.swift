//
//  SearchViewController.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit

class SearchViewController: BaseViewController {

    let searchView = SearchView()
    
    var delegate: PassSearchedImageDelegate?
    
    var photoList: [Photo] = []
    
    override func loadView() {
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 동작하지 않는 코드
        // addObserver보다 post가 먼저 신호를 보내면 받을 수 없음
//        NotificationCenter.default.addObserver(self, selector: #selector(observedRecommendedKeywordNotification(notification:)), name: NSNotification.Name("RecommendedKeyword"), object: nil)
        
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
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setDataToView(photo: photoList[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        NotificationCenter.default.post(
//            name: .selectedImage,
//            object: nil,
//            userInfo: ["name": imageList[indexPath.item], "sample": "고래밥"]
//        )
        
        delegate?.receivedImage(photo: photoList[indexPath.item])
        
        dismiss(animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UnsplashManager.shared.callSearchRequest(query: searchBar.text ?? "") { photoList in
            self.photoList = photoList
            DispatchQueue.main.async {
                self.searchView.collectionView.reloadData()
            }
        }
        
        searchView.searchBar.resignFirstResponder()
    }
}
