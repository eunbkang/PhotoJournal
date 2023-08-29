//
//  SearchView.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit

class SearchView: BaseView {
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "검색어를 입력하세요."
        
        return searchBar
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: configCollectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
//        view.collectionViewLayout = configCollectionViewLayout()
        
        return view
    }()
    
    override func configViewComponents() {
        
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    override func configLayoutConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
    
    // 클래스 밖에서 호출할 일 없고 내에서만 사용될 함수 -> private
    private func configCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let inset: CGFloat = 16
        let spacing: CGFloat = 8
        let width = (UIScreen.main.bounds.width - (spacing * 3) - (inset * 2)) / 4

        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing

        return layout
    }
}
