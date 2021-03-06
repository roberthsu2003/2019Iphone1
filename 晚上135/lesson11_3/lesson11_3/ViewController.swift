//
//  ViewController.swift
//  lesson11_3
//
//  Created by 徐國堂 on 2021/7/2.
//

import UIKit

class ViewController:UIViewController {
    var names:[String]!
    var countryCode:[String:String]!
    var cities:[[String:AnyObject]]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let namesURL = Bundle.main.url(forResource: "names", withExtension: "plist"){
            if let names = NSArray(contentsOf: namesURL) as? [String]{
                self.names = names
            }
        }
        
        if let codeURL = Bundle.main.url(forResource: "countryCode", withExtension: "plist"){
            if let countryCode = NSDictionary(contentsOf: codeURL) as? [String:String]{
                self.countryCode = countryCode
            }
        }
        
        if let cityURL = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
            
            if let cities = NSArray(contentsOf: cityURL) as? [[String:AnyObject]]{
                self.cities = cities
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(names!)
        print(countryCode!)
        
        for item in cities{
            print(item)
            print("================")
        }
    }


}

