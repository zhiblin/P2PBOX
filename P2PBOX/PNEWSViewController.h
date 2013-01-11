//
//  PNEWSViewController.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-25.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAppDelegate.h"

@interface PNEWSViewController : UIViewController<NSFetchedResultsControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
    NSManagedObjectContext *managedObjectContext;
    NSFetchedResultsController *fetchedResultsController;
}

@property(nonatomic, retain) UITableView *tableview;

@property(nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property(nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
