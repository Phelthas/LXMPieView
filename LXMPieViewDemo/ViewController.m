//
//  ViewController.m
//  TEST_Pie
//
//  Created by luxiaoming on 15/10/14.
//  Copyright © 2015年 luxiaoming. All rights reserved.
//

#import "ViewController.h"
#import "LXMPieView.h"

@interface ViewController ()<LXMPieViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *modelArray = [NSMutableArray array];
    NSArray *valueArray = @[@(10), @(20), @(30), @(40)];
    NSArray *colorArray = @[[UIColor redColor],
                            [UIColor orangeColor],
                            [UIColor yellowColor],
                            [UIColor greenColor],];
    for (int i = 0 ; i <valueArray.count ; i++) {
        LXMPieModel *model = [[LXMPieModel alloc] initWithColor:colorArray[i] value:[valueArray[i] floatValue] text:nil];
        [modelArray addObject:model];
    }
    
    LXMPieView *pieView = [[LXMPieView alloc] initWithFrame:CGRectMake(50, 50, 200, 200) values:modelArray];
    pieView.delegate = self;
    [self.view addSubview:pieView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [pieView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LXMPieViewDelegate

- (void)lxmPieView:(LXMPieView *)pieView didSelectSectionAtIndex:(NSInteger)index {
    NSLog(@"didSelectSectionAtIndex : %@", @(index));
}

@end
