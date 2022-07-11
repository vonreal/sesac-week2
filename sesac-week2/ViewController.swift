//
//  ViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pinkView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: clipsToBounds vs cornerRadius vs Shadow 조사 및 실험
        pinkView.layer.maskedCorners = [.layerMinXMinYCorner]
        
    }


}

