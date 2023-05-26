//
//  BaseViewController.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/12.
//


import UIKit

final class MemoMainViewController: UIViewController {
    
    private var titleText: String?
    private var contentText: String?
    
    let memoMainView = MemoMainView()
    let memoWriteView = MemoWriteView()
    let memoDetailView = MemoDetailView()
    var originView = MemoMainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemGray6
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        self.title = "메모 목록"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapRightBarButton))
        self.navigationController?.navigationBar.barTintColor = .systemGray6
        self.navigationController?.navigationBar.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        memoMainView.delegate2 = self
    }
    
    private func setLayout() {
        view.addSubview(memoMainView)
        memoMainView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(34)
        }
    }
    
    override func loadView() {
        super.loadView()
        originView = MemoMainView(frame: self.view.frame)
        self.view = originView
        originView.delegate2 = self
    }
    
    @objc
    func didTapRightBarButton() {
        let memoWriteViewController = MemoWriteViewController()
        memoWriteViewController.delegate = self
        self.navigationController?.pushViewController(memoWriteViewController, animated: true)
    }
    
    @objc
    func pushToDetailVC() {
        let memoDetailViewController = MemoDetailViewController()
        memoDetailViewController.titleText = titleText
        memoDetailViewController.contentText = contentText
        memoDetailViewController.setDataBind() 
        self.navigationController?.pushViewController(memoDetailViewController, animated: true)
    }
}

extension MemoMainViewController: DataBindProtocol {
    func dataBind(titletext: String, contenttext: String) {
        originView.titleMemo.append(titletext)
        originView.contentMemo.append(contenttext)
        originView.memotableView.reloadData()
        print(memoMainView.titleMemo)
    }
}

extension MemoMainViewController: DataBind2Protocol {
    func dataBind2(titletext: String, contenttext: String) {
        print("하하")
        self.titleText = titletext
        self.contentText = contenttext
    }
    
    func pushToDetail() {
        pushToDetailVC()
        print("여기임")
    }
}
