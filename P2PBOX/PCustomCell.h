//
//  PCustomCell.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-27.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCustomCell : UITableViewCell
{
    UILabel *contextName;
    UIImageView *imageOne;
    UILabel *context;
    UILabel *distance;
    UIImageView *imageTwo;
}

@property(nonatomic, retain) UILabel *contextName;
@property(nonatomic, retain) UIImageView *imageOne;
@property(nonatomic, retain) UILabel *context;
@property(nonatomic, retain) UILabel *distance;
@property(nonatomic, retain) UIImageView *imageTwo;


@end
