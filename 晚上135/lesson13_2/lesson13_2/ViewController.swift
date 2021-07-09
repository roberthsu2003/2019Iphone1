//
//  ViewController.swift
//  lesson13_2
//
//  Created by 徐國堂 on 2021/7/7.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet var tableView:UITableView!
    var cities:[[String:Any]]={
        if let plistURL = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
            if let array = NSArray(contentsOf: plistURL) as? [[String:Any]]{
                return array
            }
        }
        return [[String:Any]]()
    }()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let indexRow = indexPath.row
        let cityDic = cities[indexRow]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! MyCell
        /*
        cell.backgroundColor = UIColor.systemPink
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemTeal
        cell.selectedBackgroundView = backgroundView
         */
        cell.cityName.text = cityDic["City"] as? String
        cell.countryName.text = cityDic["Country"] as? String
        cell.continent.text = cityDic["Continent"] as? String
        if let imageName = cityDic["Image"] as? String{
            cell.cityImageView.image = UIImage(named:imageName)
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let selectedIndex = indexPath.row
        let city = cities[selectedIndex]
        if let cityName = city["City"] as? String{
            print("現在選到的城市是\(cityName)")
        }
    }


}

