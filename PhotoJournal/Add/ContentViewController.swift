//
//  ContentViewController.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {
    
    let textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .systemGray6
        
        return view
    }()
    
    // Closure 값 전달 1.
    var completionHandler: ((String) -> Void)?
    
    override func viewDidDisappear(_ animated: Bool) {
        
        guard let text = textView.text else { return }
        
        // Closure 값 전달 2.
        // 어떤 함수가 들어올지 모르는 상태지만 들어오면 이 데이터로 실행하라는 코드
        completionHandler?(text)
        
    }
    
    // MARK: - BaseViewController
    
    override func configViewComponents() {
        super.configViewComponents()
        
        view.addSubview(textView)
    }
    
    override func configLayoutConstraints() {
        textView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(250)
        }
    }
}
