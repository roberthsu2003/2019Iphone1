//
//  RateViewController.swift
//  lesson18-1
//
//  Created by 徐國堂 on 2021/2/9.
//

import UIKit

class RateViewController: UIViewController {
    @IBOutlet var backgroundImageView:UIImageView!
    @IBOutlet var containerView:UIView!
    @IBOutlet var containerImageView:UIImageView!
    var city:City!
    var num = 50;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect:blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        containerView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        containerImageView.image = UIImage(named: city.image)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        
        
    }
    
    

}
