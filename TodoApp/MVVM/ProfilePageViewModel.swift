//
//  ProfilePageViewModel.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/20.
//

import Foundation

class ProfilePageViewModel {
    private var profile: ProfileModel
    
    init(profile: ProfileModel) {
        self.profile = profile
    }
    
    var name: String {
        return "이름: \(profile.name)"
    }
    
    var ageText: String {
        return "나이: \(profile.age)"
    }
}
