//
//  ViewController.swift
//  SimpleTable
//
//  Created by 김동현 on 2023/05/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자" ,"차", "카", "타", "파", "하"]
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M","N","O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var dates: [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func touchUPAddButton(_ sender: UIButton) {
        dates.append(Date())
        
        self.tableView.reloadSections(IndexSet(integer: 2), with: .automatic)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // MARK: 몇개의 row를 표현해줄까?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    // MARK: row에 맞는 cell을 드릴께요!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.section < 2 {
            let cell: UITableViewCell =
            tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            
            let text: String = indexPath.section == 0 ? korean[indexPath.row] :
            english[indexPath.row]
            cell.textLabel?.text = text
            
            if indexPath.row == 1 {
                cell.backgroundColor = UIColor.yellow
            } else {
                cell.backgroundColor = UIColor.white
            }
            return cell
            
        } else {
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            
            cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            return section == 0 ? "한글" : "영어"
        }
        return nil
    }
        
        
        //     MARK: - Navigation
        //
        //     In a storyboard-based application, you will often want to do a little preparation before navigation
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //         Get the new view controller using segue.destination.
        //         Pass the selected object to the new view controller.
                guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
                    return
                }
                guard let cell: UITableViewCell = sender as? UITableViewCell else {
                    return
                }
                nextViewController.textToSet = cell.textLabel?.text
    }
}


