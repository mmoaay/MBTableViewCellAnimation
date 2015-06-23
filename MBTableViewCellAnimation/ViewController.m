//
//  ViewController.m
//  MBTableViewCellAnimation
//
//  Created by Perry on 15/6/23.
//  Copyright (c) 2015年 MmoaaY. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+TableViewCellAnimationCategory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self reloadAnimation];
}

#pragma mark- tableview datasource delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellIdentifier"];
        cell.textLabel.text = @"MBTableViewCellAnimation";
        cell.detailTextLabel.text = @"注意～下方高能～";
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
