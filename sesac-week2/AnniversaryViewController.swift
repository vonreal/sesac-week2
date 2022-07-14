///Users/najiun/Desktop/🌱/01. 수업/sesac-week2/sesac-week2/Base.lproj/LaunchScreen.storyboard
//  AnniversaryViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/14.
//

import UIKit

class AnniversaryViewController: UIViewController {

    @IBOutlet var imageViewList: [UIImageView]!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet var ddayLabelList: [UILabel]!
    @IBOutlet var resultLabelList: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for image in imageViewList {
            let tintView = UIView()
            
            tintView.backgroundColor = UIColor(white: 0, alpha: 0.2)
            tintView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            image.layer.cornerRadius = 10
            image.addSubview(tintView)
        }
        
        // MARK: 0714 TODO
        if #available(iOS 14, *) {  // iOS 14이상
            datePicker.preferredDatePickerStyle = .inline
        } // 그 미만은 스토리보드로 지정해 준 wheel 상태
        
        var dday = 100
        for label in ddayLabelList {
            label.text = "D+\(dday)"
            dday += 100
        }
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
//        print(sender.date)
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        
        let day: Double = 86400
        var dday: Double = 100
        
        for label in resultLabelList {
            label.text = format.string(from: sender.date.addingTimeInterval(day * dday))
            
            dday += 100
        }
    }
}
