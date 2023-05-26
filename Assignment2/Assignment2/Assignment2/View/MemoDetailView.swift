//
//  MemoDatailView.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/19.

import UIKit

import SnapKit
import Then

class MemoDetailView: UIView {
    
    let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    let contentLabel = UILabel().then {
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 15)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    private func setStyle() {
        self.backgroundColor = .white
    }
    private func setLayout() {
        self.addSubviews(titleLabel, contentLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
            $0.width.equalTo(340)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
