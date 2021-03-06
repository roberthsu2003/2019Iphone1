//
//  ViewController.swift
//  lesson11_2
//
//  Created by 徐國堂 on 2021/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //取得mainBundle內的絕路徑
        copyFilesToDocuments()
        let userDefaults = UserDefaults()
        let name = userDefaults.object(forKey: "name") as! String
        let age = userDefaults.integer(forKey: "age")
        if let level = userDefaults.object(forKey: "level") as? Int {
            print(level)
        }else{
            print("沒有level")
        }
        
        print("name:\(name)")
        print("age:\(age)")
        
        var buyer = userDefaults.persistentDomain(forName: "buyer")!
        buyer["item2"] = ["number":3, "price":17]
        
        userDefaults.setPersistentDomain(buyer, forName: "buyer")
        
        let  newBuyer = userDefaults.persistentDomain(forName: "buyer")!
        
        
        
        print(newBuyer)
        
    }
    
    //copyPlist到Sandbox的Documents
    func copyFilesToDocuments(){
        guard let sourceUrl = Bundle.main.url(forResource: "citylist", withExtension: "plist")else{
            print("沒有bundle內的plist")
            return
        }
        
        
        //取得sandbox的絕對路徑
        let fileManager = FileManager.default
        
        guard let docsurl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)else{
            print("出錯了")
            return
        }
        //為了手動的方式取得檔案的絕對路徑，在finder內查詢
        print(docsurl.path)
        let targetFileURL = docsurl.appendingPathComponent("city.plist")
        
         if !fileManager.fileExists(atPath: targetFileURL.path){
            print("沒有這個檔")
            //copy檔案進來
            do{
                try fileManager.copyItem(at: sourceUrl, to: targetFileURL)
                print("copy檔案成功")
            }catch{
                print("copy錯誤")
            }
            
            
         }else{
            print("有這個檔")
            //不用copy
         }
        
        
        let cities = NSArray(contentsOf: targetFileURL) as! [[String:Any]]
        //print(cities)
        
        /*
        let docsurl = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        docsurl.path
 */
        /*
        
        do{
            let docsurl = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(docsurl.path)
        }catch{
            print("錯誤了")
        }
 */
    }


}

