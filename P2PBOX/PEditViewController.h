//
//  PEditViewController.h
//  P2PBOX
//
//  Created by p2pmsg on 13-1-2.
//  Copyright (c) 2013年 p2pmsg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAppDelegate.h"

@interface PEditViewController : UIViewController<NSFetchedResultsControllerDelegate,UITableViewDataSource,UITableViewDelegate>{
    UITableView *tableview;
    NSManagedObjectContext *managedObjectContext;
    NSFetchedResultsController *fetchedResultsController;
}

@property(nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property(nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@property(nonatomic, retain) UITableView *tableview;



@end
