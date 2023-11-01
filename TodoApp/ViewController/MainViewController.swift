//
//  ViewController.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/18.
//

import UIKit
import CoreData
import Alamofire

class MainViewController: UIViewController {
    @IBOutlet weak var mainImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LoadTask()
        NewworkImageLoad()
    }
    
    @IBAction func profileDesignButton(_ sender: Any) {
        guard let profileDesignViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileDesign") else {return}
        self.navigationController?.pushViewController(profileDesignViewController, animated: true)
//        profileDesignViewController.modalPresentationStyle = .fullScreen
//        present(profileDesignViewController, animated: true, completion: nil)
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
    
    func NewworkImageLoad () {
        let imageUrl = "https://spartacodingclub.kr/css/images/scc-og.jpg"
        AF.request(imageUrl).response { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async{
                    self.mainImageView.image = UIImage(data: data!)
                }
            case .failure(let error):
                print("이미지 로드 실패 : \(error)")
            }
        }
    }
    

}

