//
//  ProfilePageView.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/20.
//

import UIKit
import SnapKit

class ProfilePageView: UIView {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var viewModel: ProfilePageViewModel? {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(nameLabel)
        addSubview(ageLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20) // 이름을 위로 조정
        }
        
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(10) // 나이를 이름 아래로 조정
        }
    }
    
    private func updateView() {
        self.backgroundColor = .white
        nameLabel.text = viewModel?.name
        ageLabel.text = viewModel?.ageText
    }
}



