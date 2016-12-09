//
//  RootViewController.swift
//  ZSSwiftDemo
//
//  Created by abnerzhang on 2016/11/1.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {
    
    var homeVC:HomeViewController! = HomeViewController()
    var mesVC:iMessageViewController! = iMessageViewController()
    var mineVC:MineViewController! = MineViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setTabBarVC()
        // Do any additional setup after loading the view.
    }
    
    func setTabBarVC() {
        let homeNav:BaseNavigationController = BaseNavigationController(rootViewController: homeVC)
        let homeItem = UITabBarItem(title: "首页", image: #imageLiteral(resourceName: "tab_home"), selectedImage: nil)
        homeNav.tabBarItem = homeItem
        
        let mesNav:BaseNavigationController = BaseNavigationController(rootViewController: mesVC)
        let mesItem = UITabBarItem(title: "消息", image: #imageLiteral(resourceName: "tab_message"), selectedImage: nil)
        mesNav.tabBarItem = mesItem
        
        
        let mineNav:BaseNavigationController = BaseNavigationController(rootViewController: mineVC)
        let mineItem = UITabBarItem(title: "我的", image: #imageLiteral(resourceName: "tab_my"), selectedImage: nil)
        mineNav.tabBarItem = mineItem
        
        tabBar.tintColor = kThemeColor
        
        tabBar.isTranslucent = false
        
        viewControllers = [homeNav, mesNav, mineNav]
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
