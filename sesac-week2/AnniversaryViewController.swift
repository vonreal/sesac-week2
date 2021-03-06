///Users/najiun/Desktop/đą/01. ááŽááĽá¸/sesac-week2/sesac-week2/Base.lproj/LaunchScreen.storyboard
//  AnniversaryViewController.swift
//  sesac-week2
//
//  Created by ëě§ě´ on 2022/07/14.
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
    
    // MARK: - [CODE]: ëë°ě´ ě°ě° ë° ë ě´ë¸ ę° ě¤ě íę¸°
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
            referenceDateLabel.text = "ę¸°ě¤ěźě ě¤ě í´ěŁźě¸ě."
        }
    }
    func setDdayResultLabels(dDayList: [Int]) {
        let format = DateFormatter()
        format.dateFormat = "yyyyë MMě dděź"
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
    
    // MARK: - [CODE]: datepickerěě ęł ëĽ¸ ę°ě UserDefaultě ě ěĽ
    // struct ě´ěŠ í´ëł´ę¸°: ęłě° ěěąě ě´ěŠí´ě ě´ęą°íęłź í¨ěëĽź íěŠí  ě ěě ę˛ ę°ë¤.
    func saveUDDate(date: Date) {
        let format = DateFormatter()
        format.dateFormat = "yyyyë MMě dděź"
        
        let saveDate = format.string(from: date)
        UserDefaults.standard.set(saveDate, forKey: UDDate.date.rawValue)
    }

    // MARK: - [ACTION]: ë˛íź í´ëŚ­ ě ę¸°ě¤ěź ëłę˛˝ ë° ë ě´ë¸ ěë°ě´í¸
    @IBAction func referenceDateButtonClicked(_ sender: UIButton) {
        saveUDDate(date: datePicker.date)
        setLabels(dDayList: dDays)
    }
    
}
