//
//  AnniversaryViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/14.
//

import UIKit

class AnniversaryViewController: UIViewController {

    @IBOutlet var imageViewList: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        for image in imageViewList {
            let tintView = UIView()
            
            tintView.backgroundColor = UIColor(white: 0, alpha: 0.2)
            tintView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            image.layer.cornerRadius = 10
            image.addSubview(tintView)
        }
    }

}
