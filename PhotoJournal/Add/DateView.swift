//
//  DateView.swift
//  PhotoJournal
//
//  Created by Eunbee Kang on 2023/08/29.
//

import UIKit

class DateView: BaseView {
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .date
        
        return picker
    }()
    
    override func configViewComponents() {
        addSubview(datePicker)
    }
    
    override func configLayoutConstraints() {
        datePicker.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
