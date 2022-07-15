///Users/najiun/Desktop/🌱/01. 수업/sesac-week2/sesac-week2/Base.lproj/LaunchScreen.storyboard
//  AnniversaryViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/14.
//

import UIKit

enum UDDate: String {
    case date = "date"
}

class AnniversaryViewController: UIViewController {

    @IBOutlet var imageViewList: [UIImageView]!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet var ddayLabelList: [UILabel]!
    @IBOutlet var resultLabelList: [UILabel]!
    
    @IBOutlet weak var referenceDateLabel: UILabel!
    
    let dDays = [100, 200, 300, 400]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
        setLabels(dDayList: dDays)
    }
    
    // MARK: - [DESIGN]
    func designUI() {
        designImageViews()
        designDatePickerStyle()
    }
    
    func designImageViews() {
        for image in imageViewList {
            let tintView = UIView()
            
            tintView.backgroundColor = UIColor(white: 0, alpha: 0.2)
            tintView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            image.layer.cornerRadius = 10
            image.addSubview(tintView)
        }
    }
    func designDatePickerStyle() {
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .inline
        }
    }
    
    // MARK: - [CODE]: 디데이 연산 및 레이블 값 설정하기
    func setLabels(dDayList: [Int]) {
        setDdayLabels(dDayList: dDayList)
        setReferenceDateLabel()
        setDdayResultLabels(dDayList: dDayList)
    }
    
    func setDdayLabels(dDayList: [Int]) {
        var idx = 0
        for label in ddayLabelList {
            label.text = "D+" + String(dDayList[idx])
            idx += 1
        }
    }
    func setReferenceDateLabel() {
        if let date = UserDefaults.standard.string(forKey: UDDate.date.rawValue) {
            referenceDateLabel.text = date
        } else {
            referenceDateLabel.text = "기준일을 설정해주세요."
        }
    }
    func setDdayResultLabels(dDayList: [Int]) {
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        guard let referenceDate = UserDefaults.standard.string(forKey: UDDate.date.rawValue) else {
            return
        }
        guard let date = format.date(from: referenceDate) else { return }
        var idx = 0
        
        for label in resultLabelList {
            label.text = format.string(from: getDdayCalculationDate(date: date, dDay:dDayList[idx]))
            idx += 1
        }
    }
    func getDdayCalculationDate(date: Date, dDay: Int) -> Date {
        let day: Double = 86400
        return date.addingTimeInterval(day * Double(dDay))
    }
    
    // MARK: - [CODE]: datepicker에서 고른 값을 UserDefault에 저장
    // struct 이용 해보기: 계산 속성을 이용해서 열거형과 함수를 활용할 수 있을 것 같다.
    func saveUDDate(date: Date) {
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        
        let saveDate = format.string(from: date)
        UserDefaults.standard.set(saveDate, forKey: UDDate.date.rawValue)
    }

    // MARK: - [ACTION]: 버튼 클릭 시 기준일 변경 및 레이블 업데이트
    @IBAction func referenceDateButtonClicked(_ sender: UIButton) {
        saveUDDate(date: datePicker.date)
        setLabels(dDayList: dDays)
    }
    
}
