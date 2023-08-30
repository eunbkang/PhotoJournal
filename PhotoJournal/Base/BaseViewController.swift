//
//  BaseViewController.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/28.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configViewComponents()
        configLayoutConstraints()
    }
    
    func configViewComponents() {
        print("Base configViewComponents")
        view.backgroundColor = .white
    }
    
    func configLayoutConstraints() {
        
    }
}
