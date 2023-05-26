//
//  SecondView.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class MemoWriteView: UIView, UITextViewDelegate {
    
    let titleTextField = UITextField().then {
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.borderGray.cgColor
        $0.layer.borderWidth = 1
        $0.font = .systemFont(ofSize: 15)
        $0.layer.cornerRadius = 10
        $0.attributedPlaceholder = NSAttributedString("제목을 작성해주세요")
        $0.setLeftPadding(amount: 10)
    }
    
    let contentTextViewPlaceHolder = "내용을 작성해주세요."
    
    lazy var contentTextView = UITextView().then {
        $0.textColor = UIColor.memoGray
        $0.backgroundColor = .backgroundGray
        $0.font = .systemFont(ofSize: 15)
        $0.layer.cornerRadius = 10
        $0.text = contentTextViewPlaceHolder
    }
    
    let backgroundView = UIView().then {
        $0.backgroundColor = .backgroundGray
        $0.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
        contentTextView.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    private func setStyle() {
        self.backgroundColor = .white
    }
    private func setLayout() {
        self.addSubviews(titleTextField, contentTextView)
        titleTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
            $0.width.equalTo(340)
        }
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(639)
            $0.width.equalTo(340)
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == contentTextViewPlaceHolder) {
            textView.text = nil
            textView.textColor = .black
            textView.text = ""
        }
    }
}
