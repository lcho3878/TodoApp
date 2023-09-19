//
//  DoneViewController.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/19.
//

import UIKit
import CoreData

class DoneViewController: UIViewController {
    var DoneTaskList: [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateDoneTaskList()
    }
    func UpdateDoneTaskList () {
        for task in taskList! {
            if task.isComplete == true {
                self.DoneTaskList.append(task)
            }
        }
    }
}

extension DoneViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DoneTaskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoneCell", for: indexPath) as? DoneCell else { return UITableViewCell() }
        let task = DoneTaskList[indexPath.row]
        cell.SetupUI(task)
        return cell
    }
    
    
}
