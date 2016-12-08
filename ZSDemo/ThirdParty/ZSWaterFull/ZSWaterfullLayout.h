//
//  ZSWaterfullLayout.h
//  ZSWaterFull
//
//  Created by abnerzhang on 2016/11/8.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZSCollectionViewLayoutDelegte <UICollectionViewDelegate>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section;


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section;


@end

@interface ZSWaterfullLayout : UICollectionViewLayout

/**
 *  @列数, 默认为2列
 */
@property (nonatomic, assign) NSInteger columnCount;

/**
 *  @列间距, 默认为10
 */
@property (nonatomic, assign) CGFloat minimumColumnSpacing;

/**
 *  @cell之间的上下间距, 默认为10
 */
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

/**
 *  @header的高度, 默认为0
 */
@property (nonatomic, assign) CGFloat headerHeight;

/**
 *  @footer的高度, 默认为0
 */
@property (nonatomic, assign) CGFloat footerHeight;

/**
 *  @cell在collectionView中的布局距离上, 左, 下, 右的距离, 默认 UIEdgeInsetsZero
 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;

@end
