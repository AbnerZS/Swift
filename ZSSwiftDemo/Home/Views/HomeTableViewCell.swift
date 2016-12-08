//
//  HomeTableViewCell.swift
//  ZSSwiftDemo
//
//  Created by abnerzhang on 2016/11/1.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

import UIKit
import AlamofireImage
import Kingfisher
import SnapKit
import SwiftyJSON

class HomeTableViewCell: UITableViewCell {
    
    
    
    var sJson:JSON! {
        didSet {
            if let goodsImageStr = sJson["article_image"].string {
                let arUrl = URL(string: goodsImageStr)
                proImg.af_setImage(withURL: arUrl!)
            }
            if let goodsStr = sJson["article_title"].string {
                proDescribe.text = goodsStr
            }
            
            if let idStr = sJson["article_id"].string {
                proId.text = "作品编号: " + "\(idStr)"
            }
            
            
        }
    }
    

    // cell 的初始化
    
    // 允许使用autolayout布局(OC里面可不是这样设置的)
    //setNeedsUpdateConstraints()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    // 更新布局
    override func updateConstraints() {
        super.updateConstraints()
        // 设置控件的约束条件
        setConstraints()
    }
    
    // 如果解析到数据序列化为SModel, 则使用
    // model的set方法
    var smodel:SModel? {
        didSet{
            if (smodel != nil) {
                loadData(model: smodel!)
            }
        }
        
    }
    
    func loadData(model:SModel) {
        contentView.addSubview(proImg)
        contentView.addSubview(proDescribe)
        contentView.addSubview(proId)
        
        
        if let goodsStr = model.article_title {
            proDescribe.text = goodsStr
        }
        
        if let idStr = model.article_id {
            proId.text = "作品编号: " + "\(idStr)"
        }
        
        if let urlStr = model.article_image {
            // AlamofireImage加载网络图片的方法
            let arUrl = URL(string: urlStr)
            proImg.af_setImage(withURL: arUrl!)
            
            // Kingfisher加载网络图片的方法
            // let kfUrl = URL(string: urlStr!)
            // img.kf.setImage(with: kfUrl)
        }
    }
    
    fileprivate func setConstraints() {
        contentView.addSubview(proImg)
        contentView.addSubview(proDescribe)
        contentView.addSubview(proId)
        
        proImg.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.width.equalTo(60)
        }
        
        proDescribe.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(proImg.snp.left).offset(-10)
            make.height.equalTo(45)
            make.top.equalTo(proImg.snp.top)
        }
        proDescribe.numberOfLines = 0
        
        proId.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(proImg.snp.left).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.height.equalTo(20)
        }
        proId.font = UIFont.systemFont(ofSize: 12)
        
        
        
        
    }
    
    // 懒加载的两种方式
    fileprivate let proImg:UIImageView = {
        let proImg = UIImageView()
        return proImg
    }()
    
    fileprivate lazy var proDescribe = UILabel()
    fileprivate lazy var proId = UILabel()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
