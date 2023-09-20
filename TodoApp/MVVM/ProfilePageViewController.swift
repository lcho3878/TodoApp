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
        
        // 사용자 데이터를 생성하고 ViewModel을 초기화합니다.
        let profile = ProfileModel(name: "이찬호", age: 29)
        let viewModel = ProfilePageViewModel(profile: profile)
        // ProfilePageView에 ViewModel을 연결합니다.
        profileView.viewModel = viewModel
        
        // ProfilePageView를 뷰 컨트롤러의 뷰로 설정합니다.
        view = profileView
    }
}


