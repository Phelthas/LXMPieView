//
//  LXMPieView.h
//  TEST_Pie
//
//  Created by luxiaoming on 15/10/14.
//  Copyright © 2015年 luxiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXMPieView;

@protocol LXMPieViewDelegate <NSObject>

- (void)lxmPieView:(LXMPieView *)pieView didSelectSectionAtIndex:(NSInteger)index;

@end


@interface LXMPieModel : NSObject

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat value;
@property (nonatomic, copy) NSString *text;

- (instancetype)initWithColor:(UIColor *)color value:(CGFloat)value text:(NSString *)text;

@end



@interface LXMPieView : UIView

@property (nonatomic, weak) id<LXMPieViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame values:(NSArray<LXMPieModel *> *)valueArray;

- (void)reloadData;

@end
