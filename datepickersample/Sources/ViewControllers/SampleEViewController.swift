//
//  SampleEViewController.swift
//  datepickersample
//
//  Created by Yoshiyuki Kawashima on 2019/03/03.
//  Copyright © 2019 www.huin.me. All rights reserved.
//

import UIKit

class SampleEViewController: UIViewController {
    
    @IBOutlet private weak var birthdayTextField: UITextField!
    
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var datePickerContainerView: UIView!
    
    lazy private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerContainerView.sizeToFit()
        birthdayTextField.inputView = datePickerContainerView
    }
    
    @IBAction func textFieldTouch(_ sender: UITextField) {
        sender.becomeFirstResponder()
    }
    
    @IBAction func datePickerDidValueChanged(_ sender: UIDatePicker) {
        let dateString = dateFormatter.string(from: sender.date)
        birthdayTextField.text = dateString
    }
}

extension SampleEViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        return false
    }
}
