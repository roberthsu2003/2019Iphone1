//
//  ViewController.swift
//  lesson11_2
//
//  Created by 徐國堂 on 2021/7/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myButton:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let myButton = myButton{
            print("Button有值")
        }else{
            print("Button是nil")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //可以存取所有storyboard建立的元件
        //只被執行一次
        print("ViewController內的View全部可以使用了")
        myButton.setTitle("Hello", for: UIControl.State.normal)
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("View將要顯示了")
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        print("view已經顯示了")
    }


}

