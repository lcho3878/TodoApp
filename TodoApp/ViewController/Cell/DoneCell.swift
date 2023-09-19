//
//  DoneCell.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/19.
//

import UIKit

class DoneCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func SetupUI (_ task: Task) {
        titleLabel.text = task.title
    }

}
