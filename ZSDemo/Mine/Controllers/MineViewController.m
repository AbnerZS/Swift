//
//  MineViewController.m
//  ZSDemo
//
//  Created by abnerzhang on 2016/11/17.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "MineViewController.h"
#import "WaterFullCollectionView.h"
#import "ZSWaterfullLayout.h"


@interface MineViewController ()

@property (nonatomic, strong) WaterFullCollectionView *waterFullView;
@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.waterFullView];
    // Do any additional setup after loading the view.
}

- (WaterFullCollectionView*)waterFullView {
    if (!_waterFullView) {
        
        ZSWaterfullLayout *waterLayout = [[ZSWaterfullLayout alloc] init];
        waterLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        waterLayout.minimumColumnSpacing = 10;
        waterLayout.minimumInteritemSpacing = 15;
        _waterFullView = [[WaterFullCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:waterLayout];
        [self.dataSource addObjectsFromArray:_waterFullView.dataArray];
        
        
        
    }
    return _waterFullView;
}


- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
