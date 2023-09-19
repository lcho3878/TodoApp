//
//  TodoCell.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/19.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createDateLabel: UILabel!
    @IBOutlet weak var modifyDateLabel: UILabel!
    @IBOutlet weak var completeSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        titleLabel.attributedText = nil
    }
    
    func SetupUI(_ task: Task) {
        titleLabel.text = task.title
        createDateLabel.text = task.createDate?.toString("y년 M월 d일 h시 m분 생성")
        modifyDateLabel.text = task.modifyDate?.toString("y년 M월 d일 h시 m분 수정")
//        if task.isComplete == true {
//            completeSwitch.isOn = true
//        }
//        else {
//            completeSwitch.isOn = false
//        }
        completeSwitch.isOn = task.isComplete
        completeSwitch.addTarget(self, action: #selector(CompleteSwitchToggle), for: .valueChanged)
        if completeSwitch.isOn {
            titleLabel.attributedText = titleLabel.text?.strikeThrough()
        }
    }
    
    @objc func CompleteSwitchToggle(_ sender: UISwitch) {
        taskList?[sender.tag].isComplete.toggle()
    }
}
