//
//  MemoTableViewCell.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class MemoTableViewCell: UITableViewCell {
    
    static let identifier = "MemoTableViewCell"
    
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        backgroundColor = .white
        selectionStyle = .none
        
        titleLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 22)
        }
        contentLabel.do {
            $0.font = UIFont.systemFont(ofSize: 15)
        }
    }
    
    func setHierarchy() {
        contentView.addSubviews(titleLabel, contentLabel)
    }
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(24)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(2)
            $0.leading.equalToSuperview().inset(24)
        }
    }
//    func configureCell(_ setting: String) {
//        titleLabel.text = setting
//        contentLabel.text = setting
//    }
    func configureCell(title: String, content: String) {
        titleLabel.text = title
        print("타이틀 찍힘")
        contentLabel.text = content
        print("컨텐츠 찍힘")
    }
}

