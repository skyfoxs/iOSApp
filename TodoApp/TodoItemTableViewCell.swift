//
//  TodoItemTableViewCell.swift
//  TodoApp
//
//  Created by Supakit Thanadittagorn on 14/7/18.
//  Copyright © 2018 pop. All rights reserved.
//

import UIKit

protocol TodoItemTableViewCellDelegate:class {
    func todoItemTableViewCellDidTapCheckboxButton(cell: TodoItemTableViewCell)
}

class TodoItemTableViewCell: UITableViewCell {

    weak var delegate: TodoItemTableViewCellDelegate?

    @IBOutlet weak var checkboxButton: UIButton?
    @IBOutlet weak var titleLabel: UILabel?

    func configure(item: TodoItem, delegate: TodoItemTableViewCellDelegate?) {
        titleLabel?.text = item.title
        checkboxButton?.setImage(UIImage(named: item.isDone ? "check": "uncheck"), for: .normal)
        self.delegate = delegate
    }

    @IBAction func checkboxButtonDidTap() {
        delegate?.todoItemTableViewCellDidTapCheckboxButton(cell: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
