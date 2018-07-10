//
//  AddNewItemViewController.swift
//  TodoApp
//
//  Created by Supakit Thanadittagorn on 8/7/18.
//  Copyright © 2018 pop. All rights reserved.
//

import UIKit

protocol AddNewItemViewControllerDelegate: class {
    func addNewItemViewController(controller: AddNewItemViewController, didAdd item: TodoItem)
    func addNewItemViewControllerDidCancel(controller: AddNewItemViewController)
}

class AddNewItemViewController: UIViewController {

    weak var delegate: AddNewItemViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isDoneSwitch: UISwitch!

    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
        if let title = titleTextField.text, !title.isEmpty {
            let todoItem = TodoItem(title: title, isDone: isDoneSwitch.isOn)
            delegate?.addNewItemViewController(controller: self, didAdd: todoItem)
        }
    }

    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        delegate?.addNewItemViewControllerDidCancel(controller: self)
    }
}







