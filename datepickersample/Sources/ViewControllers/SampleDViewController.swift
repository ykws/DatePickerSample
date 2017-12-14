//
//  SampleDViewController.swift
//  datepickersample
//
//  Created by k-sakata on 2017/12/14.
//  Copyright © 2017 www.huin.me. All rights reserved.
//

import UIKit

class SampleDViewController: UITableViewController {

    @IBOutlet private weak var birthdayCell: UITableViewCell!
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        switch tableView.cellForRow(at: indexPath) {
        case birthdayCell?:
            beginPickingBirtyday()
        default:
            break
        }
    }

    @IBAction func datePickerDidValueChanged(picker: UIDatePicker) {
        let dateString = dateFormatter.string(from: picker.date)
        birthdayTextField.text = dateString
    }

    func beginPickingBirtyday() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            datePickerContainerView.frame = CGRect(x: 0, y: 0, width: 320, height: 216)

            let viewController = UIViewController()
            viewController.loadViewIfNeeded()
            viewController.view.addSubview(datePickerContainerView)
            viewController.view.sizeToFit()

            viewController.modalPresentationStyle = .popover
            viewController.popoverPresentationController?.sourceView = birthdayTextField
            viewController.popoverPresentationController?.sourceRect = birthdayTextField.bounds.offsetBy(dx: -8, dy: -8)
            viewController.preferredContentSize = CGSize(width: 320, height: 216)
            present(viewController, animated: true)
        } else {
            birthdayTextField.becomeFirstResponder()
        }
    }
}

extension SampleDViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            beginPickingBirtyday()
            return false
        }
        return true
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        return false
    }
}

