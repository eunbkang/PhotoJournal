//
//  TitleViewController.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/29.
//

import UIKit

class TitleViewController: BaseViewController {
    
    let textField: UITextField = {
        let view = UITextField()
        view.placeholder = "제목을 입력하세요."
        view.backgroundColor = .systemGray6
        
        return view
    }()
    
    // Closure 값 전달 1.
    var completionHandler: ((String, Int, Bool) -> Void)?
    
    override func viewDidDisappear(_ animated: Bool) {
        
        guard let text = textField.text else { return }
        
        // Closure 값 전달 2.
        // 어떤 함수가 들어올지 모르는 상태지만 들어오면 이 데이터로 실행하라는 코드
        completionHandler?(text, 100, false)
        
    }
    
    @objc func tappedDoneButton() {
        print(#function)
        
        guard let text = textField.text else { return }
        completionHandler?(text, 200, true)
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - BaseViewController
    
    override func configViewComponents() {
        super.configViewComponents()
        
        view.addSubview(textField)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(tappedDoneButton))
    }
    
    override func configLayoutConstraints() {
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
        }
    }
}
