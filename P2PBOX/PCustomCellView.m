//
//  PCustomCellView.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-28.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PCustomCellView.h"

@implementation PCustomCellView

@synthesize context,contextName,distance,imageOne,imageTwo;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageOne = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80, 80)];
        [self addSubview:imageOne];
        self.contextName = [[UILabel alloc] initWithFrame:CGRectMake(80.0f, 5, 220, 20)];
        [self.contextName setFont:[UIFont fontWithName:@"Arial" size:17.0]];
        [self addSubview:self.contextName];
        self.context = [[UILabel alloc] initWithFrame:CGRectMake(80.0f, 30, 220, 20)];
        [self addSubview:context];
        self.distance = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 60, 200, 20)];
        [self addSubview:distance];
        
        self.imageTwo = [[UIImageView alloc] initWithFrame:CGRectMake(80.0f, 60, 20, 20)];
        [self addSubview:imageTwo];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)dealloc{
    [context release];
    [contextName release];
    [distance release];
    [imageOne release];
    [imageTwo release];
    [super dealloc];
}

@end
