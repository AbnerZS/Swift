//
//  SModel.swift
//  ZSSwiftDemo
//
//  Created by abnerzhang on 2016/11/11.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

import UIKit

class SModel: NSObject {
    var article_title:String?
    var article_image:String?
    var article_id:String?
    
    init(dict:[String:Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
    
    
}
