//
//  ItemDetailViewController.swift
//  TodoApp
//
//  Created by Supakit Thanadittagorn on 8/7/18.
//  Copyright © 2018 pop. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewController(controller: ItemDetailViewController, didAdd item: TodoItem)
    func itemDetailViewController(controller: ItemDetailViewController, didEdit item: TodoItem)
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
}

class ItemDetailViewController: UIViewController {

    weak var delegate: ItemDetailViewControllerDelegate?
    var todoItem: TodoItem?

    var isInEditMode: Bool {
        return todoItem != nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let todoItem = todoItem {
            title = "Edit item"
            titleTextField.text = todoItem.title
            isDoneSwitch.setOn(todoItem.isDone, animated: true)
        } else {
            title = "Add new item"
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isDoneSwitch: UISwitch!

    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, !title.isEmpty else {
            return
        }
        if let todoItem = todoItem {
            todoItem.title = title
            todoItem.isDone = isDoneSwitch.isOn
            delegate?.itemDetailViewController(controller: self, didEdit: todoItem)
        } else {
            let todoItem = TodoItem(title: title, isDone: isDoneSwitch.isOn)
            delegate?.itemDetailViewController(controller: self, didAdd: todoItem)
        }
    }

    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        delegate?.itemDetailViewControllerDidCancel(controller: self)
    }
}







