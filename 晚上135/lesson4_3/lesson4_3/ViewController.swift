//
//  ViewController.swift
//  lesson4_3
//
//  Created by 徐國堂 on 2021/6/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let families = UIFont.familyNames
        var message = ""
        for name in families{
            message += "\(name)\n"
        }
        print(message)
    }


}

