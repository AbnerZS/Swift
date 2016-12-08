//
//  HomeViewController.swift
//  ZSSwiftDemo
//
//  Created by abnerzhang on 2016/11/1.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailDeletate {
    var tableArray:[JSON] = [JSON]()
    
    fileprivate let cellIdentifier = "cellIdentifier"
    
    lazy var  homeTableView:UITableView? = UITableView(frame:CGRect(x:0,y:0,width:kScreenWidth,height:kScreenHeight), style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingData()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        homeTableView?.dataSource = self
        homeTableView?.delegate = self
        homeTableView?.register(HomeTableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        view.addSubview(homeTableView!)
        // Do any additional setup after loading the view.
    }
    func loadingData() {
        let parameters:Parameters = ["article_class_id":"", "curpage":"1"]
        let urlString = "https://www.cacc.cn/_rpc/?act=news&op=getNewsList&datetype=raw"
        
        
        HomeApi.post(parameters: parameters, url: urlString, success:{(json) in
            for (index, subJson):(String, JSON) in json {
                print(index)
                self.tableArray.append(subJson)
            }
            self.homeTableView?.reloadData()
        }) {(error) in
            print(error)
            
        }
    }
    
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // 如果解析的数据为json时这样处理
            //let value = self.json["datas"]
            //return value.count
            return self.tableArray.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            //let cell:HomeTableViewCell = HomeTableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as!HomeTableViewCell
            
            
            //let dic = self.tableArray[indexPath.row] as!NSDictionary
            //cell.dataDic = dic
            // 序列化为SModel时这样写
            //cell.smodel = (self.tableArray[indexPath.row] as!SModel)
            cell.sJson = self.tableArray[indexPath.row]
            //let value = self.json["datas"][indexPath.r]
            
            // 如果解析的数据为json时这样处理
            //let cell:UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "HomeCell")
            //cell.textLabel?.text = self.json["datas"][indexPath.row]["article_abstract"].string
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80.0
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeD = HomeDetailViewController()
        
        homeD.attributeStr = "属性传值"
        
        homeD.changeColorBlock = { (color) -> Void in
            print("\(color.classForCoder)")
            
        }
        
        homeD.changeStringBlock = { (string) -> Void in
            print(string)
            
        }
        
        homeD.testBlock = {
            print("闭包测试")
        }
        
        
        homeD.delegate = self;
        let notiName = NSNotification.Name(rawValue: "noti")

        NotificationCenter.default.addObserver(self, selector:#selector(didMsgRecv(notification:)),
                                               name: notiName, object: nil)
        
        hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(homeD, animated: true)
        hidesBottomBarWhenPushed = false
    }
    
    func delegateFun(str: String) {
        print(str)
    }
    
    @objc func didMsgRecv(notification:NSNotification) {
        print("didMsgRecv: \(notification.userInfo)")
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
