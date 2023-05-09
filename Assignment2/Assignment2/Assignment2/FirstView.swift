//
//  FirstView.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class FirtView: UIView {
    
    
    let currentLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20)
        $0.text = "메모가 없습니다🙅‍♂️"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("FirtView Error!")
    }
    private func setStyle() {
        self.backgroundColor = .white
    }
    private func setLayout() {
        self.addSubview(currentLabel)
        currentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
        }
    }
}

