//
//  UIViewController+TableViewCellAnimationCategories.h
//  JinJiangDuCheng
//
//  Created by Perry on 15/4/27.
//  Copyright (c) 2015年 SmartJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TableViewCellAnimationCategories)

@property (nonatomic, strong) NSNumber *curMaxAnimatedSection;

@property (nonatomic, strong) NSMutableArray *curMaxAnimatedRow;
@property (nonatomic, strong) NSNumber *needTableViewCellAnimation;

-(void)reloadAnimation;

@end
