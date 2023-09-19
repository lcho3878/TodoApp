//
//  ViewController.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/18.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LoadTask()
    }
    
    @IBAction func profileDesignButton(_ sender: Any) {
        guard let profileDesignViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileDesign") else {return}
        profileDesignViewController.modalPresentationStyle = .fullScreen
        present(profileDesignViewController, animated: true, completion: nil)
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

}

