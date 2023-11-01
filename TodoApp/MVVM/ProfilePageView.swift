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
    
    let myButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("버튼", for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
    
    let myTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름 입력"
        return textField
    }()
    
    let printButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("출력버튼", for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
    
    var viewModel: ProfilePageViewModel? {
        didSet {
            viewModel?.updateView = { [weak self] in
                self?.updateView()
            }
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
        addSubview(myButton)
        addSubview(myTextField)
        addSubview(printButton)
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20) // 이름을 위로 조정
        }
        
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(10) // 나이를 이름 아래로 조정
        }
        myButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ageLabel.snp.bottom).offset(10)
        }
        myTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myButton.snp.bottom).offset(10)
            make.width.equalTo(160)
        }
        printButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myTextField.snp.bottom).offset(10)
        }
        
    }
    
    private func updateView() {
        print("view 업데이트")
        self.backgroundColor = .white
        nameLabel.text = viewModel?.name
        ageLabel.text = viewModel?.ageText
    }
}



