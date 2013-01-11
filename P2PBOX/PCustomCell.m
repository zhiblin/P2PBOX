//
//  PCustomCell.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-27.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PCustomCell.h"

@implementation PCustomCell

@synthesize contextName,context,imageOne,distance,imageTwo;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.imageOne = [[UIImageView alloc] initWithFrame:CGRectMake(80.0f, 10, 60, 60)];
        [self addSubview:imageOne];
        self.contextName = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 10, 220, 20)];
        [self addSubview:self.contextName];
        self.context = [[UILabel alloc] initWithFrame:CGRectMake(80.0f, 10, 220, 20)];
        [self addSubview:context];
        self.distance = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 60, 200, 20)];
        [self addSubview:distance];
        
        self.imageTwo = [[UIImageView alloc] initWithFrame:CGRectMake(80.0f, 10, 20, 20)];
        [self addSubview:imageTwo];
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
