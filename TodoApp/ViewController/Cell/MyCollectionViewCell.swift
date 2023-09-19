//
//  MyCollectionViewCell.swift
//  TodoApp
//
//  Created by t2023-m079 on 2023/09/19.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "cell2"
    var img = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetting() {
        self.backgroundColor = .gray
        self.addSubview(img)
        
        img.contentMode = .scaleToFill
        img.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(0)
            $0.bottom.equalTo(-20)
        }
    }
}
