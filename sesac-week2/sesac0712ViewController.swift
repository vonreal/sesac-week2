//
//  sesac0712ViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/12.
//

import UIKit

enum MusicType: Int {
    case all = 0
    case korea
    case other
}

class sesac0712ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setUserNickname()
        
        // 세그먼트 레이블
        
        
    }
    
    // 배경색, 레이블, 이미지
    func example() -> (UIColor, String, String){
        let color: [UIColor] = [.yellow, .red, .blue]
        let image: [String] = ["sesac_slime6", "sesac_slime7", "sesac_slime8"]
        
        return (color[0], "hi", image[0])
        
    }
    
    func setUserNickname() {
        let nicknameList = ["고래밥", "새우깡", "칙촉", "격투가"]
        let select = nicknameList.randomElement()!
        textLabel.text = "저는 \(select)입니다."
    }

    func showAlertController() {
        //1. 흰 바탕: UIAlertController
        let alert = UIAlertController(title: "타이틀", message: "여기는 메시지가 들어갑니다.", preferredStyle: .alert)
        
        //2. 버튼
        let okButton = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let webButton = UIAlertAction(title: "새 창으로 열기", style: .default, handler: nil)
        let copy = UIAlertAction(title: "복사하기", style: .destructive, handler: nil)
        
        //3. 1+2
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        alert.addAction(webButton)
        alert.addAction(copy)
        
        //4. present
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func tabClicked(_ sender: UITapGestureRecognizer) {
        showAlertController()
    }
    
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == MusicType.all.rawValue {
            textLabel.text = "첫번째 세그먼트 선택"
        } else if segmentControl.selectedSegmentIndex == 1 {
            textLabel.text = "두번째 세그먼트 선택"
        } else {
            textLabel.text = "세번째 세그먼트 선택"
        }
    }
}
