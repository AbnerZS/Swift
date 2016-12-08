//
//  HomeDetailViewController.swift
//  ZSSwiftDemo
//
//  Created by abnerzhang on 2016/11/11.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

import UIKit

protocol DetailDeletate {
    func delegateFun(str:String)
}

class HomeDetailViewController: UIViewController {
    
    var attributeStr:String?
    
    
    
    var changeColorBlock:( (_ color:UIColor) -> ())?
    var changeStringBlock:( (_ str:String) -> ())?
    
    var testBlock:(()->())?
    
    var delegate:DetailDeletate?
    
    
    
    lazy var btn = UIButton()
    
    lazy var delegateBtn = UIButton()
    
    let button:UIButton = {
        let button = UIButton(type: .custom)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        btn.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        btn.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        btn.setTitle("闭包(Block)\n有参数无返回值", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.titleLabel?.numberOfLines = 0
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        
        
        button.frame = CGRect(x: 50, y: 200, width: 100, height: 100)
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.setTitle("闭包(Block)\n无参数无返回值", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.titleLabel?.numberOfLines = 0
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.addSubview(button)
        
        
        
        delegateBtn.frame = CGRect(x: 150, y: 100, width: 100, height: 100)
        delegateBtn.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        delegateBtn.setTitle("协议", for: .normal)
        delegateBtn.addTarget(self, action: #selector(delegateAction(delegate:)), for: .touchUpInside)
        view.addSubview(delegateBtn)
        
        let label = UILabel(frame: CGRect(x: 150, y: 200, width: 100, height: 100))
        label.text = attributeStr
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.addSubview(label)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func btnAction() {
        changeColorBlock!(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        changeStringBlock!("this is a string")
    }
    
    @objc func buttonAction() {
        testBlock!()
    }
    
    @objc func delegateAction(delegate:UIButton) ->() {
        self.delegate?.delegateFun(str: "这是一个协议")
        
        let notiName = NSNotification.Name(rawValue: "noti")
        
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: ["1":"通知2传得值"])
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
