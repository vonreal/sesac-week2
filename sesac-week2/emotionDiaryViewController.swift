//
//  emotionDiaryViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/11.
//

import UIKit

// 딕셔너리를 이용해서 key값은 감정의 이름을 담고 value값으로 감정을 클릭한 횟수를 가진다.
// 버튼들에게는 Title이 딕셔너리의 key값으로 1:1 매칭되어있고 이 title을 바탕으로
// 어떤 버튼을 눌렀는지 확인할 수 있다.
// 그래서 그 버튼의 타이틀에 해당하는 value값의 인덱스를 증가시키고 라벨의 값을 다시 설정해주는 식으로 구현했다.

class emotionDiaryViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet var emotionButtons: [UIButton]!
    
    @IBOutlet var emotionLabels: [UILabel]!
    
    let emotionList = ["만족해", "기뻐", "사랑해", "화나", "그냥그래", "피곤해", "긴장돼", "짜증나", "슬퍼"]
    var emotionDic: [String:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
        
        initEmotionDic()
        setTitleAndTagButtons(emotionButtons)
        setLabels(emotionLabels)
    }
    
    // [CODE - Init values]
    func initEmotionDic() {
        for item in emotionList {
            emotionDic[item] = 0
        }
    }
    
    // [CODE - Init and update values]
    func setTitleAndTagButtons(_ buttons: [UIButton]) {
        guard (buttons.count == emotionList.count) else { print("[에러] button 갯수와 emotionList 갯수를 맞춰주세요."); return }
        
        var idx = 0
        for button in buttons {
            button.setTitle(emotionList[idx], for: .normal)
            button.tag = idx
            idx += 1
        }
    }
    
    func setLabels(_ labels: [UILabel]) {
        guard (labels.count == emotionList.count) else { print("[에러] label 갯수와 emotionList 갯수를 맞춰주세요."); return }
        
        var idx = 0
        for label in labels {
            let emotion = emotionList[idx]
            if let emotionCnt = emotionDic[emotion] {
                label.text = emotion + " " + String(emotionCnt)
            }
            idx += 1
        }
    }
    
    func updateLabels(_ label: UILabel, emotion: String) {
        let emotionCnt = String(emotionDic[emotion]!)
        label.text = emotion + " " + emotionCnt
    }
    
    // [CODE - Action]
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        guard let buttonEmotion = sender.currentTitle else { print("[에러] button의 title이 없습니다."); return }

        emotionDic[buttonEmotion]! += 1
        updateLabels(emotionLabels[sender.tag], emotion: buttonEmotion)
    }
    
    // [CODE - Design]
    func designUI() {
        designTitle()
    }
    func designTitle() {
        titleLabel.text = "감정 다이어리"
    }
}
