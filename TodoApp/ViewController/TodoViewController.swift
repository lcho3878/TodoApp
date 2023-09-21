//
//  TodoViewController.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/19.
//

import UIKit
import CoreData

class TodoViewController: UIViewController {
    @IBOutlet weak var taskTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        LoadTask()
        taskTableView.reloadData()
    }
    
    @IBAction func addButtonClick(_ sender: Any) {
        let alert = UIAlertController(title: "할일 추가", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "할일 내용을 입력하세요"
        }
        let ok = UIAlertAction(title: "OK", style: .default) { ok in
            self.AddTask((alert.textFields?[0].text)!)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    
    func LoadTask () {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        do {
           taskList = try context.fetch(Task.fetchRequest())
        } catch {
           print(error.localizedDescription)
        }
    }
    
    func SaveTask() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
            try context.save()
        } catch {
            print("저장 안됨")
        }
    }
    
    func AddTask (_ title: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        if let entity = entity {
            let task = NSManagedObject(entity: entity, insertInto: context)
            task.setValue(title, forKey: "title")
            task.setValue(Date(), forKey: "createDate")
            task.setValue(false, forKey: "isComplete")
            do {
                try context.save()
                print("저장완료")
            } catch {
                print("저장실패")
            }
        }
        LoadTask()
        taskTableView.reloadData()
    }
}

extension TodoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoCell else {return UITableViewCell()}
        let task = taskList?[indexPath.row]
        cell.SetupUI(task!)
        cell.completeSwitch.tag = indexPath.row
        cell.completeSwitch.addTarget(self, action: #selector(CompleteSwitchToggle), for: .valueChanged)
        return cell
    }
    
    @objc func CompleteSwitchToggle(_ sender: UISwitch) {
        SaveTask()
        taskTableView.reloadSections(IndexSet(0...0), with: .automatic)
//        LoadTask()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "수정 및 삭제", message: nil, preferredStyle: .alert)
        alert.addTextField{ textField in
            textField.placeholder = taskList?[indexPath.row].title
            textField.clearButtonMode = .whileEditing
        }
        let ok = UIAlertAction(title: "수정하기", style: .default, handler: { ok in
            taskList?[indexPath.row].title = alert.textFields?[0].text
            taskList?[indexPath.row].modifyDate = Date()
            self.SaveTask()
            tableView.reloadData()
        })
        let delete = UIAlertAction(title: "삭제하기", style: .destructive) { delete in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            do {
                context.delete(taskList![indexPath.row])
                try context.save()
            } catch {
                print("저장 안됨")
            }
            self.LoadTask()
            tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(ok)
        alert.addAction(delete)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
}
