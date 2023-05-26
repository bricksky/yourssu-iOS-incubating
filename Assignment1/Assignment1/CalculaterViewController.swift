//
//  ViewController.swift
//  Assignment1
//
//  Created by 김동현 on 2023/04/02.
import UIKit

import SnapKit


final class ViewController: BaseViewController {
    
    private let originView = CalculaterView()
    
    override func loadView() {
        self.view = originView
    }
    
    var a: Int = 0
    var b: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
    }
    
    func setTarget() {
        originView.addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
        originView.subButton.addTarget(self, action: #selector(sub), for: .touchUpInside)
        originView.mulButton.addTarget(self, action: #selector(mul), for: .touchUpInside)
        originView.divButton.addTarget(self, action: #selector(div), for: .touchUpInside)
    }


//    @objc func add() {
//        if let text1 = originView.textField1.text, let text2 = originView.textField2.text {
//            if let a = Int(text1), let b = Int(text2) {
//                originView.resultLabel.text = "\(a) + \(b) = \(a+b)"
//            } else {
//                originView.resultLabel.text = "값을 먼저 입력해주세요"
//                originView.resultLabel.textColor = .gray
//            }
//        } else {
//            originView.resultLabel.text = "값을 모두 입력해주세요"
//            originView.resultLabel.textColor = .gray
//        }
//    }
    
    @objc func add() {
        guard let text1 = originView.textField1.text,
              let text2 = originView.textField2.text,
              let a = Int(text1),
              let b = Int(text2)
        else {
            originView.resultLabel.text = (originView.textField1.text == nil || originView.textField2.text == nil)
                ? "값을 모두 입력해주세요"
                : "잘못된 입력입니다"
            originView.resultLabel.textColor = .gray
            return
        }
        
        originView.resultLabel.text = "\(a) + \(b) = \(a + b)"
    }

    
    @objc func sub() {
        if let text1 = originView.textField1.text, let text2 = originView.textField2.text {
            if let a = Int(text1), let b = Int(text2) {
                originView.resultLabel.text = "\(a) - \(b) = \(a-b)"
            } else {
                originView.resultLabel.text = "값을 먼저 입력해주세요"
                originView.resultLabel.textColor = .gray
            }
        } else {
            originView.resultLabel.text = "값을 모두 입력해주세요"
            originView.resultLabel.textColor = .gray
        }
    }
    
    @objc func mul() {
        if let text1 = originView.textField1.text, let text2 = originView.textField2.text {
            if let a = Int(text1), let b = Int(text2) {
                originView.resultLabel.text = "\(a) * \(b) = \(a*b)"
            } else {
                originView.resultLabel.text = "값을 먼저 입력해주세요"
                originView.resultLabel.textColor = .gray
            }
        } else {
            originView.resultLabel.text = "값을 모두 입력해주세요"
            originView.resultLabel.textColor = .gray
        }
    }
    
    @objc func div() {
        if let text1 = originView.textField1.text, let text2 = originView.textField2.text {
            if let a = Int(text1), let b = Int(text2) {
                if b != 0 {
                    let result = a / b
                    originView.resultLabel.text = "\(a) / \(b) = \(result)"
                } else {
                    originView.resultLabel.text = "0으로 나눌 수 없습니다."
                    originView.resultLabel.textColor = .gray
                }
            } else {
                originView.resultLabel.text = "값을 먼저 입력해주세요."
                originView.resultLabel.textColor = .gray
            }
        } else {
            originView.resultLabel.text = "값을 모두 입력해주세요."
        }
    }
}
