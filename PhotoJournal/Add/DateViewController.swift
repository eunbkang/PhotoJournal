//
//  DateViewController.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController {

    let mainView = DateView()
    
    // Protocol 값 전달 2.
    var delegate: PassDataDelegate?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Protocol 값 전달3.
        delegate?.receiveDate(date: mainView.datePicker.date)
    }
    
    override func configViewComponents() {
        
    }

}
