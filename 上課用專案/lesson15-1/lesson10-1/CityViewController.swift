//
//  CityViewController.swift
//  lesson15-1
//
//  Created by 徐國堂 on 2021/1/28.
//

import UIKit

class CityViewController: UIViewController {
    var message:String = ""
    @IBOutlet var messageLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
