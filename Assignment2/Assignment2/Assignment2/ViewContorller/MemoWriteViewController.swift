//
//  SecondViewController.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/19.
//

import UIKit

// MARK: 데이터 전달을 위한 프로토콜 생성 (FirstViewController로 전달할 예정)
protocol DataBindProtocol: AnyObject {
    func dataBind(titletext: String, contenttext: String)
}

final class MemoWriteViewController: UIViewController {
    // MARK: 데이터 전달을 위한 Delagate 프로퍼티 생성
    var delegate: DataBindProtocol?
    
    private let memoDetailView = MemoDetailView()
    
    private var originView = MemoWriteView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemGray6
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        // MARK: 오른쪽 버튼
        let registerButton = UIButton().then {
            $0.setTitle("등록", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17, weight:.bold)
            $0.titleLabel?.textColor = .systemBlue
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(didTappedRegisterButton))
        }
        
        // MARK: 중간 라벨
        self.title = "메모 작성"
        // MARK: delegate 프로퍼티 선언 부분
        weak var delegate: DataBindProtocol?
    }
    
    override func loadView() {
        super.loadView()
        originView = MemoWriteView(frame: self.view.frame)
        self.view = originView
    }
    
    @objc
    func didTappedRegisterButton() {
        guard let titletext = originView.titleTextField.text else { return }
        guard let contenttext = originView.contentTextView.text else { return }
        print(originView.titleTextField.text)
        print(originView.contentTextView.text)
        delegate?.dataBind(titletext: titletext, contenttext: contenttext)
        self.navigationController?.popViewController(animated: true)
    }
}
