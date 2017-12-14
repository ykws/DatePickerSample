//
//  ViewController.swift
//  datepickersample
//
//  Created by k-sakata on 2017/12/14.
//  Copyright © 2017年 www.huin.me. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet private weak var firstNameCell: UITableViewCell!
    @IBOutlet private weak var firstNameTextField: UITextField!

    @IBOutlet private weak var lastNameCell: UITableViewCell!
    @IBOutlet private weak var lastNameTextField: UITextField!

    @IBOutlet private weak var emailAddressCell: UITableViewCell!
    @IBOutlet private weak var emailAddressTextField: UITextField!

    @IBOutlet private weak var telephoneNumberCell: UITableViewCell!
    @IBOutlet private weak var telephoneNumberTextField: UITextField!

    @IBOutlet private weak var birthdayCell: UITableViewCell!
    @IBOutlet private weak var birthdayTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let cell = tableView.cellForRow(at: indexPath)
        switch cell {
        case firstNameCell?:
            firstNameTextField.becomeFirstResponder()
        case lastNameCell?:
            lastNameTextField.becomeFirstResponder()
        case emailAddressCell?:
            emailAddressTextField.becomeFirstResponder()
        case telephoneNumberCell?:
            telephoneNumberTextField.becomeFirstResponder()
        case birthdayCell?:
            birthdayTextField.becomeFirstResponder()
        default:
            break
        }
    }
}

