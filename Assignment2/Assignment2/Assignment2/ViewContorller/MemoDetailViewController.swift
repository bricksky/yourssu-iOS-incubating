//
//  MemoDetailViewController.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/21.
//

import UIKit

final class MemoDetailViewController: UIViewController {
    
    var titleText: String?
    var contentText: String?
    
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
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    private func setLayout() {
        view.addSubviews(titleLabel, contentLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
            $0.width.equalTo(340)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(639)
            $0.width.equalTo(340)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()

        self.title = "메모 상세"
        weak var delegate: DataBindProtocol?
    }
    
    func setDataBind() {
        guard let titleText = self.titleText else {return}
        guard let contentText = self.contentText else {return}
        titleLabel.text = titleText
        contentLabel.text = contentText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemGray6
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    @objc
    func listButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

