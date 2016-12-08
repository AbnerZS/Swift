//
//  BaseNavigationController.swift
//  ZSSwiftDemo
//
//  Created by abnerzhang on 2016/11/1.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = kThemeColor
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        //navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
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
