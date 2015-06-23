//
//  UIViewController+TableViewCellAnimationCategory.m
//
//  Created by MmoaaY on 15/4/27.
//  Copyright (c) 2015年 SmartJ. All rights reserved.
//

#import "UIViewController+TableViewCellAnimationCategory.h"
#import <objc/runtime.h>
static const void *curMaxAnimatedRowKey = &curMaxAnimatedRowKey;

static const void *needTableViewCellAnimationKey = &needTableViewCellAnimationKey;

static const void *curMaxAnimatedSectionKey = &curMaxAnimatedSectionKey;



@implementation UIViewController (TableViewCellAnimationCategory)

@dynamic curMaxAnimatedRow;
@dynamic needTableViewCellAnimation;

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.needTableViewCellAnimation boolValue]){
        NSInteger curMaxAnimatedRowCount = self.curMaxAnimatedRow.count;
        if (curMaxAnimatedRowCount < indexPath.section+1){
            for (int i = 0; i < indexPath.section+1-curMaxAnimatedRowCount; i++){
                [self.curMaxAnimatedRow addObject:@0];
            }
        }
        NSInteger curMaxRow = [[self.curMaxAnimatedRow objectAtIndex:indexPath.section] integerValue];
        if ((indexPath.row+1) > curMaxRow){
            curMaxRow = indexPath.row+1;
            [self.curMaxAnimatedRow replaceObjectAtIndex:indexPath.section withObject:[NSNumber numberWithInteger:curMaxRow]];
            
            cell.layer.transform = CATransform3DMakeScale(1.03, 1.03, 1.03);
            cell.layer.opacity = 0.25f;
            
            [UIView animateWithDuration:0.25 animations:^{
                cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
                cell.layer.opacity = 1.0f;
            }];
        }
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    if ([self.needTableViewCellAnimation boolValue]){
        if (section+1 > [self.curMaxAnimatedSection integerValue]){
            self.curMaxAnimatedSection = [NSNumber numberWithInteger:section+1];
            view.layer.transform = CATransform3DMakeScale(1.03, 1.03, 1.03);
            view.layer.opacity = 0.25f;
            
            [UIView animateWithDuration:0.25 animations:^{
                view.layer.transform = CATransform3DMakeScale(1, 1, 1);
                view.layer.opacity = 1.0f;
            }];
        }
    }
}

- (NSNumber *)curMaxAnimatedSection {
    return objc_getAssociatedObject(self, curMaxAnimatedSectionKey);
}

- (void)setCurMaxAnimatedSection:(NSNumber *)curMaxAnimatedSection{
    objc_setAssociatedObject(self, curMaxAnimatedSectionKey, curMaxAnimatedSection, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)curMaxAnimatedRow {
    return objc_getAssociatedObject(self, curMaxAnimatedRowKey);
}

- (void)setCurMaxAnimatedRow:(NSMutableArray *)curMaxAnimatedRow{
    objc_setAssociatedObject(self, curMaxAnimatedRowKey, curMaxAnimatedRow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)needTableViewCellAnimation{
    return objc_getAssociatedObject(self, needTableViewCellAnimationKey);
}

-(void)setNeedTableViewCellAnimation:(NSNumber *)needTableViewCellAnimation{
    objc_setAssociatedObject(self, needTableViewCellAnimationKey, needTableViewCellAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)reloadAnimation{
    self.curMaxAnimatedSection = @0;
    self.curMaxAnimatedRow = [[NSMutableArray alloc] init];
    self.needTableViewCellAnimation = [NSNumber numberWithBool:YES];
}

@end
