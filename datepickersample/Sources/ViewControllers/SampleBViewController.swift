//
//  SampleBViewController.swift
//  datepickersample
//
//  Created by k-sakata on 2017/12/14.
//  Copyright © 2017 www.huin.me. All rights reserved.
//

import UIKit

class SampleBViewController: UITableViewController {

    @IBOutlet private weak var birthdayCell: UITableViewCell!
    @IBOutlet private weak var birthdayTextView: UITextView!

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
        birthdayTextView.inputView = datePickerContainerView
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        switch tableView.cellForRow(at: indexPath) {
        case birthdayCell?:
            birthdayTextView.becomeFirstResponder()
        default:
            break
        }
    }

    @IBAction func datePickerDidValueChanged(picker: UIDatePicker) {
        let dateString = dateFormatter.string(from: picker.date)
        birthdayTextView.text = dateString
    }
}

extension SampleBViewController: UITextViewDelegate {

    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        return false
    }
}
