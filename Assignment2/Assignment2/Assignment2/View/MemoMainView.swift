//
//  FirstView.swift
//  Assignment2
//
//  Created by 김동현 on 2023/05/05.
//

import UIKit

import SnapKit
import Then

protocol DataBind2Protocol: AnyObject {
    func dataBind2(titletext: String, contenttext: String)
    func pushToDetail()
}

final class MemoMainView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var titleMemo: [String] = [ ]
    var contentMemo: [String] = [ ]
    
    weak var delegate2: DataBind2Protocol?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.numberOfSections == 0 {
            tableView.addSubview(currentLabel)
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleMemo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else {
                return UITableViewCell()
            }
            cell.configureCell(title: titleMemo[indexPath.row], content: contentMemo[indexPath.row])
            currentLabel.isHidden = true
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    let memotableView = UITableView()
    let currentLabel = UILabel().then {
        $0.textColor = .mainGray
        $0.font = .systemFont(ofSize: 20)
        $0.text = "메모가 없습니다\n메모를 추가해주세요!"
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    init() {
        super.init(frame: .zero)
        setStyle()
        setLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
        memotableView.delegate = self
        memotableView.dataSource = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("FirtView Error!")
    }
    private func setStyle() {
        self.backgroundColor = .white
        memotableView.do {
            $0.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .white
            $0.delegate = self
            $0.dataSource = self
        }
    }
    private func setLayout() {
        self.addSubviews(currentLabel,memotableView)
        currentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(426)
            $0.centerX.equalToSuperview()
        }
        memotableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().offset(10)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("w23242r")
        let cell = tableView.cellForRow(at: indexPath) as? MemoTableViewCell
        let cellTitle = cell?.titleLabel.text ?? ""
        let cellContent = cell?.contentLabel.text ?? ""
        
        guard let delegatetrue = delegate2 else { return }
        self.delegate2?.dataBind2(titletext: cellTitle , contenttext: cellContent)
        self.delegate2?.pushToDetail()
        print("wwwrer")
    }
}
