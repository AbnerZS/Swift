//
//  WaterFullCollectionView.m
//  ZSDemo
//
//  Created by AbnerZhang on 2016/12/1.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "WaterFullCollectionView.h"
#import "ZSWaterfullLayout.h"

static NSString *const waterFullIdentifier = @"waterFullIdentifier";
@interface WaterFullCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource,ZSCollectionViewLayoutDelegte>

@end

@implementation WaterFullCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataArray = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            float arc = arc4random() % 100 + 50;
            [self.dataArray addObject:[NSNumber numberWithFloat:arc]];
            [self setupCollectionView];
        }
    }
    return self;
}

-(void)setupCollectionView {
    self.dataSource = self;
    self.delegate = self;
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:waterFullIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:waterFullIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *num = self.dataArray[indexPath.row];
    float arc = [num floatValue];
    
    CGSize size = CGSizeMake((kScreenWidth - 30) / 3, arc);
    return size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%zi", indexPath.row);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
