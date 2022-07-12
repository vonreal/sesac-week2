//
//  launchScreenViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/12.
//

import UIKit

class launchScreenViewController: UIViewController {

    @IBOutlet weak var nicknameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nicknameList = ["용감한 쿠키", "슬퍼하는 어피치", "레전더", "어쌔신 크리드", "호빵맨"]
        
        nicknameLabel.text = nicknameList.randomElement()
    }
}
