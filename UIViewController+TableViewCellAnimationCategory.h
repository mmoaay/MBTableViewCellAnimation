//
//  UIViewController+TableViewCellAnimationCategory.h
//
//  Created by MmoaaY on 15/4/27.
//  Copyright (c) 2015年 SmartJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TableViewCellAnimationCategory)

@property (nonatomic, strong) NSNumber *curMaxAnimatedSection;

@property (nonatomic, strong) NSMutableArray *curMaxAnimatedRow;
@property (nonatomic, strong) NSNumber *needTableViewCellAnimation;

// 调用此方法可以重新开始动画
-(void)reloadAnimation;

@end
