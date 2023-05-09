//
//  StartViewController.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/04.
//

import UIKit

final class RootViewController: UIViewController {
    
    private var originView = FirtView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "메모 목록"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapRightBarButton))
        self.navigationController?.navigationBar.backgroundColor = .lightGray
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func loadView() {
        
        super.loadView()
        originView = FirtView(frame: self.view.frame)
        self.view = originView
    }
    
    
    
    @objc
    func didTapRightBarButton() {
        self.dismiss(animated: true)
    }
}
