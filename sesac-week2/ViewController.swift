//
//  ViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var asdf: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "sesac_slime6")?.withRenderingMode(.alwaysOriginal)
        
        _ = #imageLiteral(resourceName: "sesac_slime2")
        _ = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        asdf.setImage(image, for: .normal)
    }
    
    func showAlertController() {
        //1. 흰 바탕: UIAlertController
        let alert = UIAlertController(title: "타이틀", message: "여기는 메시지가 들어갑니다.", preferredStyle: .actionSheet)
        
        //2. 버튼
        let okButton = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let webButton = UIAlertAction(title: "새 창으로 열기", style: .default, handler: nil)
        let copy = UIAlertAction(title: "복사하기", style: .destructive, handler: nil)
        
        //3. 1+2
        alert.addAction(okButton)
//        alert.addAction(cancelButton)
        alert.addAction(webButton)
//        alert.addAction(copy)
        
        //4. present
        alert.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func aaa(_ sender: UIButton) {
        showAlertController()
    }
}

