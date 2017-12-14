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

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        switch action {
        case #selector(select(_:)):
            return true
        case #selector(selectAll(_:)):
            return true
        case #selector(copy(_:)):
            return true
        default:
            return false
        }
    }

    override func select(_ sender: Any?) {
        debugPrint("select was called, but not implemented yet.")
    }

    override func selectAll(_ sender: Any?) {
        debugPrint("selectAll was called, but not implemented yet.")
    }

    override func copy(_ sender: Any?) {
        debugPrint("copy was called, but not implemented yet.")
    }
}

extension DateInputLabel {
    private func setupView() {
        isUserInteractionEnabled = true

        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(gesture:)))
        addGestureRecognizer(longTap)

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

    @objc func handleLongPressGesture(gesture: UILongPressGestureRecognizer) {
        guard let text = text, !text.isEmpty else {
            return
        }
        let menuController = UIMenuController.shared
        if !menuController.isMenuVisible {
            let bounds = textRect(forBounds: self.bounds, limitedToNumberOfLines: 1)
            menuController.setTargetRect(bounds, in: self)
            menuController.setMenuVisible(true, animated: true)
        }
    }
}
