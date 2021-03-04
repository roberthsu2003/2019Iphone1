//
//  DataSource.swift
//  lesson22-1
//
//  Created by 徐國堂 on 2021/3/2.
//

import Foundation
import SQLite3

class DataSource{
    //singleton class
    //建立type store property
    //property要實作closure的執行
    static var db:OpaquePointer!;
    
    static let main:DataSource = {
        //這個closure的執行只會被執行一次
        print("closure 被執行了")
        return DataSource()
    }()
    
    //computed property
    var allCitys:[City]{
        
        return [City]()
    }
    
    
    //type method
    static func copyFilesToDocuments(){
        //bundle路徑
        let sourcePath = Bundle.main.path(forResource: "citys", ofType: "db")
        
        let targetPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var targetPath = targetPaths.first ?? ""
        targetPath += "/citys.db"
        print(targetPath)
        
        if !FileManager.default.fileExists(atPath: targetPath){
            
            if (try? FileManager.default.copyItem(atPath: sourcePath!, toPath: targetPath)) == nil{
                print("copy 失敗")
                return
            }
            //手動將plist內的資料儲存到db檔案內
            let plistSourcePath = Bundle.main.path(forResource: "citylist", ofType: "plist")
            fillSQLData(plistPath: plistSourcePath!, dbTagetPath: targetPath)
        }
    }
    
    static func fillSQLData(plistPath:String, dbTagetPath:String){
        print("plist路徑:\(plistPath)")
        print("db路徑:\(dbTagetPath)")
        if sqlite3_open(dbTagetPath, &db) == SQLITE_OK{
            print("db open")
        }else{
            print("db open 錯誤")
        }
        var cities:[[String:Any]]! = NSArray(contentsOfFile: plistPath) as? [[String:Any]]
        for city in cities{
            var statement:OpaquePointer!
            let sqlInsertString = "INSERT INTO city(cityName, continent,country,image,description,lat,lon,url) VALUES (?,?,?,?,?,?,?,?)"
            if sqlite3_prepare_v2(db, sqlInsertString, -1, &statement, nil) == SQLITE_OK{
                //print("stament 建立了")
            }else{
                //print("stament 建立失敗")
            }
            
            for (key,value) in city{
                switch key{
                    case "City":
                        sqlite3_bind_text(statement, 1, (value as! NSString).utf8String, -1, nil)
                    case "Continent":
                        sqlite3_bind_text(statement, 2, (value as! NSString).utf8String, -1, nil)
                    
                    case "Country":
                        sqlite3_bind_text(statement, 3, (value as! NSString).utf8String, -1, nil)
                    
                    case "Image":
                        sqlite3_bind_text(statement, 4, (value as! NSString).utf8String, -1, nil)
                    
                    case "Local":
                        sqlite3_bind_text(statement, 5, (value as! NSString).utf8String, -1, nil)
                    
                    case "lat":
                        sqlite3_bind_double(statement, 6, value as! Double)
                    
                    case "long":
                        sqlite3_bind_double(statement, 7, value as! Double)
                    
                    case "url":
                        sqlite3_bind_text(statement, 8, (value as! NSString).utf8String, -1, nil)
                    default:
                        break
                }
            }
           
            if sqlite3_step(statement) == SQLITE_DONE{
                print("插入一筆成功")
                sqlite3_finalize(statement)
            }
            
            //print(city)
            //print("===========")
        }
        
    }
    
    
}
