//
//  ProfilePageViewModel.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/20.
//

import Foundation

class ProfilePageViewModel {
    private var profile: ProfileModel{
        didSet{
            self.updateView?()
        }
    }
    var updateView: (() -> Void)? // 화면 업데이트 콜백
    
    init(profile: ProfileModel) {
        self.profile = profile
    }
    
    var name: String {
        return "이름: \(profile.name)"
    }
    
    var ageText: String {
        return "나이: \(profile.age)"
    }
    
    func updateNameToKimChanHo(name: String) {
        print("view모델 업데이트")
        profile.name = name
    }
}
