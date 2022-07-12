//
//  emotionDiaryViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/11.
//

import UIKit


// 해당 코드를 통해서 원하는 UI적 결과물이 나오려면 다음이 명확해야한다는 한계점이 있다.
//  한계점: outlet collections(buttons, labels)의 순서와 emotionList의 순서는 의도한 대로 일치해야한다.
//  배열(outlet collection 포함)이 순서를 가진 자료형이라는 특성을 사용하였다.
class emotionDiaryViewController: UIViewController {

    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    
    lazy var emotionDic: [UIButton:(UILabel, emotion: String, emotionCnt: Int)] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emotionList = ["행복해", "좋아!", "사랑해", "화나!", "그냥그래", "졸려", "황당해", "별로야", "억울해"]
        
        if validation(emotionList.count) != 0 {
            setEmotionDic(emotionList)
            setLabels(emotionList)
        }
    }
    
    // [C언어 방식 활용] swift 형식의 에러 처리 확인하고 개선하기
    // [CODE - 유효검사: 인덱스 오류 방지]
    func validation(_ emotionListCnt: Int) -> Int {
        let buttonCnt = emotionButtons.count
        let labelCnt = emotionLabels.count
        
        if (buttonCnt != labelCnt || buttonCnt != emotionListCnt) {
            print("갯수가 상이합니다. UI를 다시 한 번 확인해주세요.")
            return 0
        }
        return 1
    }
    
    // [CODE - 값 설정: 딕셔너리 초기값 설정]
    func setEmotionDic(_ emotionList: [String]) {
        var idx = 0
        
        for button in emotionButtons {
            let label = emotionLabels[idx]
            let emotion = emotionList[idx]
            
            emotionDic[button] = (label, emotion, 0)
            idx += 1
        }
    }
    
    // [CODE - 값 설정: 라벨 초기값 설정]
    func setLabels(_ emotionList: [String]) {
        var idx = 0
        
        for label in emotionLabels {
            label.text = emotionList[idx] + " 0"
            idx += 1
        }
    }
    
    // [CODE - 액션: 버튼 클릭 시 클릭값 증가 및 레이블에 증가된 값 반영]
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        guard let (label, emotion, emotionCnt) = emotionDic[sender] else { return }

        let clickCnt = emotionCnt + 1
        
        emotionDic[sender]!.emotionCnt = clickCnt
        label.text = emotion + " " + String(clickCnt)
    }
}
