//
//  PContextListViewController.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-27.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLBSViewController.h"

@interface PContextListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *tableview;
    NSMutableArray *mutablearray;
    NSString *titlestr;
    NSString *categoryID;
    PLBSViewController *plbs;
}


@property(nonatomic, retain) UITableView *tableview;
@property(nonatomic, retain) NSMutableArray *mutablearray;
@property(nonatomic, retain) NSString *titlestr;
@property(nonatomic, retain) NSString *categoryID;
@property(nonatomic, retain) PLBSViewController *plbs;


@end
