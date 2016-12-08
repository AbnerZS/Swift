//
//  HomeApi.swift
//  ZSSwiftDemo
//
//  Created by AbnerZhang on 2016/11/29.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


typealias success = (_ json:JSON) -> ()


class HomeApi: NSObject {
    
    
    class func post(parameters:Parameters, url:String, success: @escaping success, failure:@escaping (_ error:Error)->()) {
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                let dataArray = json["datas"]
                success(dataArray)
                
            case .failure(let error):
                failure(error)
                break
                
            }
        }
    }
}


//private func loadingData() {
//    let parameters:Parameters = ["article_class_id":"", "curpage":"1"]
//    let urlString = "https://www.cacc.cn/_rpc/?act=news&op=getNewsList&datetype=raw"
//    
//    Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//        
//        switch response.result {
//        case .success(let value):
//            
//            self.json = JSON(value)
//            
//            switch self.json.type {
//            case .array:
//                break
//            case .dictionary:
//                // 如果解析的数据为json时这样处理
//                if let arr = self.json["datas"].array {
//                    
//                    for dic in arr {
//                        let model = SModel(dict: dic.dictionaryObject!)
//                        self.tableArray.add(model)
//                    }
//                }
//                
//                
//                
//                break
//            default:
//                print(self.json)
//                break
//                
//            }
//            
//        case .failure(let error):
//            print(error)
//            break
//        }
//        self.homeTableView?.reloadData()
//        
//        
//        // 可以解析出数据
//        //                switch response.result {
//        //                case .success(let value):
//        //                let json = value as! NSDictionary
//        //                let arr = json.object(forKey: "datas") as! NSArray
//        //                let arr = (value as! NSDictionary).object(forKey: "datas") as! NSArray
//        //                for dic in arr {
//        //                    self.tableArray.add(dic)
//        //                }
//        //                for dic in arr {
//        //                    self.tableArray.add(dic)
//        //                }
//        //                 case .failure(let error):
//        //                 print(error)
//        //                 break
//        //                }
//        //                self.homeTableView?.reloadData()
//    }
//}




