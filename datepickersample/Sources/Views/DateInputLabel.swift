//
//  ActionableLabel.swift
//  datepickersample
//
//  Created by k-sakata on 2017/12/14.
//  Copyright © 2017 www.huin.me. All rights reserved.
//

import UIKit

final class DateInputLabel: UILabel {

    var datePickerContainerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override var canResignFirstResponder: Bool {
        return true
    }

    override var inputView: UIView? {
        return datePickerContainerView
    }
}

extension DateInputLabel {
    private func setupView() {
        isUserInteractionEnabled = true

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardDidHideNotification(notification:)),
                                               name: .UIKeyboardDidHide,
                                               object: nil)
    }

    @objc func handleKeyboardDidHideNotification(notification: Notification) {
        if isFirstResponder {
            resignFirstResponder()
        }
    }
}
