//
//  PDetailMsg.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-29.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PDetailMsg : NSManagedObject

@property (nonatomic, retain) NSString * pCategoryID;
@property (nonatomic, retain) NSString * pDetailMsgContext;
@property (nonatomic, retain) NSDate * pDetailMsgDate;
@property (nonatomic, retain) NSString * pDetailMsgID;
@property (nonatomic, retain) NSData * pDetailMsgImageOne;
@property (nonatomic, retain) NSData * pDetailMsgImageTwo;
@property (nonatomic, retain) NSString * pDetailMsgLat;
@property (nonatomic, retain) NSString * pDetailMsgLng;
@property (nonatomic, retain) NSString * pDetailMsgName;

@end
