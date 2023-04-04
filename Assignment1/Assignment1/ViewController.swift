//
//  ViewController.swift
//  Assignment1
//
//  Created by 김동현 on 2023/04/02.
//

import UIKit
import SnapKit



class ViewController: UIViewController {                // 다시 짜는 코드
    
    private lazy var textfield1: UITextField = {        // UITextField를 만들었습니다.
        let textField = UITextField()
        textField.placeholder = "첫번째 숫자를 입력해주세요"
        let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView1
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 2
       // textField.text() = Int
        return textField
    }()
    
    private lazy var textfield2: UITextField = {       // UITextField를 만들었습니다.
        let textField = UITextField()
        textField.placeholder = "두번째 숫자를 입력해주세요"
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView2
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
      
        return textField
    }()
    
    private lazy var nameLabel: UILabel = {        // UILabel를 만들었습니다.
        let label = UILabel()
        label.text = "버튼을 눌러주세요!"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        return label
    }()
    
    private lazy var addButton: UIButton = {        // UIBuutton을 만들었습니다.(더하기)
        let button = UIButton()
        button.setTitle("더하기", for: .normal)
        button.backgroundColor = .systemTeal
        //  button.setTitleColor = .black
        //button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    
    private lazy var subButton: UIButton = {        // UIBuutton을 만들었습니다.(빼기)
        let button = UIButton()
        button.setTitle("빼기", for: .normal)
        button.backgroundColor = .systemTeal
        // button.setTitleColor = .black
        //button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    
    private lazy var mulButton: UIButton = {        // UIBuutton을 만들었습니다.(곱하기)
        let button = UIButton()
        button.setTitle("곱하기", for: .normal)
        button.backgroundColor = .systemTeal
        //   button.setTitleColor = .black
        //button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 20
        return button
    } ()
    
    private lazy var divButton: UIButton = {        // UIBuutton을 만들었습니다.(나누기)
        let button = UIButton()
        button.setTitle("나누기", for: .normal)
        button.backgroundColor = .systemTeal
        //button.setTitleColor = .black
        //   button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
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
        
        view.addSubview(textfield1)
        view.addSubview(textfield2)
        view.addSubview(nameLabel)
        view.addSubview(addButton)
        view.addSubview(subButton)
        view.addSubview(mulButton)
        view.addSubview(divButton)
        
        // textfield1에 관한 레이아웃
        textfield1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(157)
            make.leading.equalToSuperview().offset(47)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        

        // textfield2에 관한 레이아웃
        textfield2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(202)
            make.leading.equalToSuperview().offset(47)
            make.width.equalTo(300) // wuidth값을 줄바에 trailing로 값을 설정해주는게 좋음
            make.height.equalTo(35)
        }
        
        // nameLabel에 관한 레이아웃
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(261)
            make.leading.equalToSuperview().offset(142)
            //make.width.equalTo(108)
            //make.height.equalTo(22)
            make.center.centerX
        }
        
        // addButton에 관한 레이아웃
        addButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(311)
            make.leading.equalToSuperview().offset(46)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        // subButton에 관한 레이아웃
        subButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(360)
            make.leading.equalToSuperview().offset(46)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        // mulButtonButton에 관한 레이아웃
        mulButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(410)
            make.leading.equalToSuperview().offset(46)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        // divButton에 관한 레이아웃
        divButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(460)
            make.leading.equalToSuperview().offset(46)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
  /*
    @objc func add() {
        a = Int(textfield1.text)
        b = Int(textfield2.text)
        nameLabel.text = "\(a) + \(b) = \(a+b)"
    }

    @objc func sub() {
        a = Int(textfield1.text)
        b = Int(textfield2.text)
        nameLabel.text = "\(a) - \(b) = \(a-b)"
    }

    @objc func mul() {
        a = Int(textfield1.text)
        b = Int(textfield2.text)
        nameLabel.text = "\(a) * \(b) = \(a*b)"
    }

    @objc func div() {
        a = Int(textfield1.text)
        b = Int(textfield2.text)
        nameLabel.text = "\(a) / \(b) = \(a/b)"
    }
    */
    
}
