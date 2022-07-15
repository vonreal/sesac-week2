//
//  TransitionSecondViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/15.
//

import UIKit

class TransitionSecondViewController: UIViewController {

    @IBOutlet weak var mottoTextView: UITextView!
    /*
        1. 앱을 켜서 데이터를 가지고 와 텍스트 뷰에 보여준다.
        2. 텍스트 뷰에 다른 데이터를 입력하고 버튼을 누르면 바뀐 데이터를 저장해준다. -> UserDefault
     */
    
    @IBOutlet weak var emotionCntLabel: UILabel!
    let userDefaultKey = "nickname"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("second: ", #function)
        
        
        // nickname을 찾고 있으면 값 반환 없으면 nil 반환.
        if let result = UserDefaults.standard.string(forKey: userDefaultKey) {
            mottoTextView.text = result
            print(result)
        } else {
            mottoTextView.text = "아무개"
        }
        
        let result = UserDefaults.standard.integer(forKey: "emotion")
        emotionCntLabel.text = String(result)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("second: ", terminator: "")
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("second: ", terminator: "")
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("second: ", terminator: "")
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("second: ", terminator: "")
        print(#function)
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        // nickname이라는 키에 mottoTextView.text 값 저장.
        UserDefaults.standard.set(mottoTextView.text, forKey: userDefaultKey)
        print("저장되었습니다.")
    }
    
    @IBAction func emotionCntUpButtonClicked(_ sender: UIButton) {
        let clickedData = UserDefaults.standard.integer(forKey: "emotion") + 1
        UserDefaults.standard.set(clickedData, forKey: "emotion")
        emotionCntLabel.text = String(clickedData)
        print("누적클릭횟수: \(clickedData)")
    }
}
