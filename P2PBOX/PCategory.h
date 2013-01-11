//
//  PCategory.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-29.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PCategory : NSManagedObject

@property (nonatomic, retain) NSDate * pCategoryDate;
@property (nonatomic, retain) NSString * pCategoryID;
@property (nonatomic, retain) NSData * pCategoryImage;
@property (nonatomic, retain) NSString * pCategoryJudge;
@property (nonatomic, retain) NSString * pCategoryName;

@end
