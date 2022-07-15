//
//  TransitionFirstViewController.swift
//  sesac-week2
//
//  Created by 나지운 on 2022/07/15.
//

import UIKit

class TransitionFirstViewController: UIViewController {

    @IBOutlet weak var randomNubmerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("first: ", terminator: "")
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("first: ", terminator: "")
        print(#function)
        randomNubmerLabel.text = "\(Int.random(in: 1...100))"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("first: ", terminator: "")
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("first: ", terminator: "")
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("first: ", terminator: "")
        print(#function)
    }
    
    // 1. 
    @IBAction func unwindTranstionFirstVC(segue: UIStoryboardSegue) {
        print("unwind \(segue)")
    }

}
