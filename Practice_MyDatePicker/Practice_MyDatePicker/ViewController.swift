//
//  ViewController.swift
//  Practice_MyDatePicker
//
//  Created by 김동현 on 2023/05/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel : UILabel!
    let dataFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print("Value change")
        
        let date: Date = self.datePicker.date
        //let dateString: String = self.dateFormatter.string(from: date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

