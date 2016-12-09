//
//  ZSCollectionViewLayout.swift
//  ZSSwiftDemo
//
//  Created by AbnerZhang on 2016/11/28.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

import UIKit

protocol ZSCollectionViewLayoutDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, collectionViewLayout layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize

    
    func collectionView(_ collectionView: UICollectionView, collectionViewLayout layout:UICollectionViewLayout,heightForHeaderInSection section:NSInteger) ->CGFloat;
    
    

    func collectionView(_ collectionView: UICollectionView, collectionViewLayout layout:UICollectionViewLayout,heightForFooterInSection section:NSInteger) ->CGFloat;

    
}

class ZSCollectionViewLayout: UICollectionViewLayout, UICollectionViewDelegate {
    let unionSize:NSInteger = 20

    var delegate:ZSCollectionViewLayoutDelegate?
    
    /**
     *  @列数, 默认为2列
     */
    var columnCount:Float! {
        didSet {
            self.invalidateLayout()
        }
        
    }
    
    /**
     *  @列间距, 默认为10
     */
    var minimumColumnSpacing:Float! {
        didSet {
            self.invalidateLayout()
        }
    }
    /**
     *  @cell之间的上下间距, 默认为10
     */
    var minimumInteritemSpacing:CGFloat! {
        didSet {
            self.invalidateLayout()
        }
    }
    /**
     *  @header的高度, 默认为0
     */
    var headerHeight:CGFloat! {
        didSet {
        invalidateLayout()
        }
    }
    /**
     *  @footer的高度, 默认为0
     */
    var footerHeight:CGFloat! {
        didSet {
            invalidateLayout()
        }
    }
    /**
     *  @cell在collectionView中的布局距离上, 左, 下, 右的距离, 默认 UIEdgeInsetsZero
     */
    var sectionInset:UIEdgeInsets! {
        didSet {
            invalidateLayout()
        }
    }
    
    /// Array to store height for each column(数组来存储每一列的高度)
    lazy var columnHeights = NSMutableArray()
    /// Array of arrays. Each array stores item attributes for each section
    lazy var sectionItemAttributes = NSMutableArray()
    /// Array to store attributes for all items includes headers, cells, and footers
    lazy var allItemAttributes = NSMutableArray()
    /// Dictionary to store section headers' attribute
    lazy var headersAttribute = NSMutableDictionary()
    /// Dictionary to store section footers' attribute
    lazy var footersAttribute = NSMutableDictionary()
    /// Array to store union rectangles
    lazy var unionRects = NSMutableArray()
    /// Width for each item
    var itemWidth:Double = 0
    
    override init() {
        super.init()
        commonInit()
    }
    
    func commonInit() {
        columnCount = 2;
        minimumColumnSpacing = 10;
        minimumInteritemSpacing = 10;
        headerHeight = 0;
        footerHeight = 0;
        sectionInset = UIEdgeInsets.zero;
    }
    
    
    override func prepare() {
        super.prepare()
        
        let numberOfSections = self.collectionView?.numberOfSections;
        if numberOfSections == 0 {
            return;
        }
        delegate = collectionView?.delegate as! ZSCollectionViewLayoutDelegate?
        let width:Float = Float(collectionView!.frame.size.width) - Float(sectionInset.left) - Float(sectionInset.right)
        
        let f:Float = (width - (columnCount - 1) * minimumColumnSpacing)
        itemWidth = Double(floorf( f / columnCount))
        
        headersAttribute.removeAllObjects()
        footersAttribute.removeAllObjects()
        unionRects.removeAllObjects()
        columnHeights.removeAllObjects()
        allItemAttributes.removeAllObjects()
        sectionItemAttributes.removeAllObjects()
        
        for _ in 0 ..< Int(columnCount) {
            columnHeights.add(0)
        }
        var top:Float
        UICollectionViewLayoutAttributes *attributes

        for var section in 0 ..< numberOfSections {
            
        }
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
