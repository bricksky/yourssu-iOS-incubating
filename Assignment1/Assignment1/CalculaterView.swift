//
//  CalculaterView.swift
//  Assignment1
//
//  Created by 김동현 on 2023/04/25.
//

import UIKit

import SnapKit

final class CalculaterView: UIView {
    
    lazy var textField1: UITextField = {
        let textField = UITextField()
        textField.placeholder = "첫번째 숫자를 입력해주세요"
        let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView1
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        return textField
    }()
    
    lazy var textField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = "두번째 숫자를 입력해주세요"
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView2
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        return textField
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "버튼을 눌러주세요!"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("더하기", for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 20
        return button
    } ()
    
    lazy var subButton: UIButton = {
        let button = UIButton()
        button.setTitle("빼기", for: .normal)
        button.backgroundColor = .systemTeal
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    
    lazy var mulButton: UIButton = {
        let button = UIButton()
        button.setTitle("곱하기", for: .normal)
        button.backgroundColor = .systemTeal
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    
    lazy var divButton: UIButton = {
        let button = UIButton()
        button.setTitle("나누기", for: .normal)
        button.backgroundColor = .systemTeal
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setstyle()
        setlayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    private func setstyle() {
        self.backgroundColor = .white
    }
    
   private func setlayout() {
       self.addSubviews(textField1,textField2,resultLabel,addButton,subButton,mulButton,divButton)
       
        textField1.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(157)
            make.leading.equalToSuperview().inset(47)
            make.trailing.equalToSuperview().inset(47)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        
        textField2.snp.makeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(47)
            make.trailing.equalToSuperview().inset(47)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(47)
            make.trailing.equalToSuperview().inset(47)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        subButton.snp.makeConstraints { make in
            make.top.equalTo(addButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(47)
            make.trailing.equalToSuperview().offset(-47)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        mulButton.snp.makeConstraints { make in
            make.top.equalTo(subButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(47)
            make.trailing.equalToSuperview().offset(-47)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        divButton.snp.makeConstraints { make in
            make.top.equalTo(mulButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(47)
            make.trailing.equalToSuperview().offset(-47)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
