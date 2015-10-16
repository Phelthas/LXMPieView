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

@property (nonatomic, strong) LXMPieView *pieView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *modelArray = [NSMutableArray array];
    NSArray *valueArray = @[@(12), @(23), @(31), @(44)];
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
    self.pieView = pieView;
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button setTitle:@"play" forState:UIControlStateNormal];
    button.center = self.view.center;
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(handleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LXMPieViewDelegate

- (void)lxmPieView:(LXMPieView *)pieView didSelectSectionAtIndex:(NSInteger)index {
    NSLog(@"didSelectSectionAtIndex : %@", @(index));
}

#pragma mark - buttonAction

- (void)handleButtonTapped:(UIButton *)sender {
    [self.pieView reloadData];
}

@end
