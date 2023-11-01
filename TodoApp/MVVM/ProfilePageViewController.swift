//
//  ProfilePageViewController.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/19.
//

import UIKit

class ProfilePageViewController: UIViewController {
    private let profileView = ProfilePageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profile = ProfileModel(name: "이찬호", age: 29) //Model
        let viewModel = ProfilePageViewModel(profile: profile)
        profileView.viewModel = viewModel
        
        // ProfilePageView를 뷰 컨트롤러의 뷰로 설정합니다.
        view = profileView
        profileView.myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        profileView.printButton.addTarget(self, action: #selector(printButtonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        // 버튼이 눌렸을 때 ViewModel을 통해 이름을 변경
        let rename = profileView.myTextField.text ?? ""
        profileView.viewModel?.updateNameToKimChanHo(name: rename)
    }
    
    @objc func printButtonTapped() {
        // 버튼이 눌렸을 때 ViewModel을 통해 이름을 변경
        print(profileView.viewModel?.name)
    }
}


