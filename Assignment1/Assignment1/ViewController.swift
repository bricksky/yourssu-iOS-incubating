//
//  ViewController.swift
//  Assignment1
//
//  Created by 김동현 on 2023/04/02.


import UIKit
import SnapKit


class ViewController: UIViewController {
    
    var a: Int = 0
    var b: Int = 0
    
    private lazy var textField1: UITextField = {
        let textField = UITextField()
        textField.placeholder = "첫번째 숫자를 입력해주세요"
        let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView1
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        // textField.text() = Int
        return textField
    }()
    
    private lazy var textField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = "두번째 숫자를 입력해주세요"
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView2
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        
        return textField
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "버튼을 눌러주세요!"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("더하기", for: .normal)
        button.backgroundColor = .systemTeal
        //  button.setTitleColor = .black
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    
    private lazy var subButton: UIButton = {
        let button = UIButton()
        button.setTitle("빼기", for: .normal)
        button.backgroundColor = .systemTeal
        // button.setTitleColor = .black
        button.addTarget(self, action: #selector(sub), for: .touchUpInside)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    
    private lazy var mulButton: UIButton = {
        let button = UIButton()
        button.setTitle("곱하기", for: .normal)
        button.backgroundColor = .systemTeal
        //   button.setTitleColor = .black
        button.addTarget(self, action: #selector(mul), for: .touchUpInside)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    
    private lazy var divButton: UIButton = {
        let button = UIButton()
        button.setTitle("나누기", for: .normal)
        button.backgroundColor = .systemTeal
        //button.setTitleColor = .black
        button.addTarget(self, action: #selector(div), for: .touchUpInside)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    func layout() {
        view.addSubview(textField1)
        view.addSubview(textField2)
        view.addSubview(resultLabel)
        view.addSubview(addButton)
        view.addSubview(subButton)
        view.addSubview(mulButton)
        view.addSubview(divButton)
        
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
    
    @objc func add() {
        if let text1 = textField1.text, let text2 = textField2.text {
            if let a = Int(text1), let b = Int(text2) {
                resultLabel.text = "\(a) + \(b) = \(a+b)"
            } else {
                resultLabel.text = "값을 먼저 입력해주세요"
                resultLabel.textColor = .gray
            }
        } else {
            resultLabel.text = "값을 모두 입력해주세요"
            resultLabel.textColor = .gray
        }
    }
    
    @objc func sub() {
        if let text1 = textField1.text, let text2 = textField2.text {
            if let a = Int(text1), let b = Int(text2) {
                resultLabel.text = "\(a) - \(b) = \(a-b)"
            } else {
                resultLabel.text = "값을 먼저 입력해주세요"
                resultLabel.textColor = .gray
            }
        } else {
            resultLabel.text = "값을 모두 입력해주세요"
            resultLabel.textColor = .gray
        }
    }
    
    @objc func mul() {
        if let text1 = textField1.text, let text2 = textField2.text {
            if let a = Int(text1), let b = Int(text2) {
                resultLabel.text = "\(a) * \(b) = \(a*b)"
            } else {
                resultLabel.text = "값을 먼저 입력해주세요"
                resultLabel.textColor = .gray
            }
        } else {
            resultLabel.text = "값을 모두 입력해주세요"
            resultLabel.textColor = .gray
        }
    }
    
    @objc func div() {
        if let text1 = textField1.text, let text2 = textField2.text {
            if let a = Int(text1), let b = Int(text2) {
                if b != 0 {
                    let result = a / b
                    resultLabel.text = "\(a) / \(b) = \(result)"
                } else {
                    resultLabel.text = "0으로 나눌 수 없습니다."
                    resultLabel.textColor = .gray
                }
            } else {
                resultLabel.text = "값을 먼저 입력해주세요."
                resultLabel.textColor = .gray
            }
        } else {
            resultLabel.text = "값을 모두 입력해주세요."
        }
    }
    
}
