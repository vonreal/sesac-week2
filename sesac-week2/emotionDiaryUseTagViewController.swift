//
//  emotionDiaryUseTagViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/12.
//

import UIKit

class emotionDiaryUseTagViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initButtonsTag()
    }
    
    func initButtonTag(_ buttons: [UIButton]) {
        var idx = 0
        for button in buttons {
            button.tag = idx
            idx += 1
        }
    }
    
    func updateLabels(_ labels: [UILabel]) {
        
        var emotionCnt = dic[sender.title]
        labels[sender.tag] = emotionCnt
    }

}
