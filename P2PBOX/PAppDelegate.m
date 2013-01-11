//
//  PAppDelegate.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-25.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PAppDelegate.h"
#import "PNEWSViewController.h"
#import "PHistoryViewController.h"
#import "PDisturbViewController.h"
#import "PFavoriteViewController.h"
#import "PSettingViewController.h"
#import "PCategory.h"
#import "PDetailMsg.h"

@implementation PAppDelegate

- (void)dealloc
{
    [_window release];
    [_managedObjectContext release];
    [_managedObjectModel release];
    [_persistentStoreCoordinator release];
    [super dealloc];
}

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    /*
    PCategory *pc = (PCategory *)[NSEntityDescription insertNewObjectForEntityForName:@"PCategory" inManagedObjectContext:self.managedObjectContext];
    pc.pCategoryID = @"1";
    pc.pCategoryName = @"国际美食";
    pc.pCategoryJudge = @"1";
    NSDateFormatter *timeFormatter=[[NSDateFormatter alloc]init];
    [timeFormatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
    pc.pCategoryDate = [NSDate date];
    //[self saveContext];
    [pc release];
    PCategory *pc1 = (PCategory *)[NSEntityDescription insertNewObjectForEntityForName:@"PCategory" inManagedObjectContext:self.managedObjectContext];
    pc1.pCategoryID = @"2";
    pc1.pCategoryName = @"交通银行";
    pc1.pCategoryJudge = @"1";
    pc1.pCategoryDate = [NSDate date];
    //[self saveContext];
    PCategory *pc2 = (PCategory *)[NSEntityDescription insertNewObjectForEntityForName:@"PCategory" inManagedObjectContext:self.managedObjectContext];
    pc2.pCategoryID = @"3";
    pc2.pCategoryName = @"北京银行";
    pc2.pCategoryJudge = @"1";
    pc2.pCategoryDate = [NSDate date];
    
   
   
    PDetailMsg *pd = (PDetailMsg *)[NSEntityDescription insertNewObjectForEntityForName:@"PDetailMsg" inManagedObjectContext:self.managedObjectContext];
    pd.pCategoryID =@"1";
    pd.pDetailMsgID = @"1";
    //pd.pDetailDate = [NSDate date];
    pd.pDetailMsgName = @"厦门扁食";
    pd.pDetailMsgContext = @"1938年12月，5只大熊猫被走私到英国，其中4只被伦敦动物园买下。曾为英皇室拍摄照片后来做过战地记者的摄影师 Bert Hardy 正给大熊猫拍照，正好大熊猫又爬上凳子做出为他儿子拍照的动作。";
    pd.pDetailMsgLat = @"99.9493";
    pd.pDetailMsgLng = @"129.1183";
    pd.pDetailMsgImageOne = UIImageJPEGRepresentation([UIImage imageNamed:@"jiaozi.jpeg"], 0.9);
    
     [self saveContext];
     */
    //最新咨询页面
    PNEWSViewController *newsview = [[[PNEWSViewController alloc] init] autorelease];
    UINavigationController *newsnav = [[[UINavigationController alloc] initWithRootViewController:newsview] autorelease];
    UITabBarItem *favorites = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:0]autorelease];
    newsnav.tabBarItem = favorites;
    
    //历史纪录页面
    PHistoryViewController *historyview = [[[PHistoryViewController alloc] init] autorelease];
    UINavigationController *historynav = [[[UINavigationController alloc] initWithRootViewController:historyview] autorelease];
    UITabBarItem *history = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:1]autorelease];
    historynav.tabBarItem = history;
    
    //勿扰页面
    PDisturbViewController *disturbview = [[[PDisturbViewController alloc] init] autorelease];
    UINavigationController *disturbnav = [[[UINavigationController alloc] initWithRootViewController:disturbview] autorelease];
    UITabBarItem *disturb = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:2]autorelease];
    disturbnav.tabBarItem = disturb;
    
    //喜爱页面
    PFavoriteViewController *favoriteview = [[[PFavoriteViewController alloc] init] autorelease];
    UINavigationController *favnav = [[[UINavigationController alloc] initWithRootViewController:favoriteview] autorelease];
    UITabBarItem *favorite = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:3]autorelease];
    favnav.tabBarItem = favorite;
    
    //设置页面
    PSettingViewController *settingview = [[[PSettingViewController alloc] init] autorelease];
    UINavigationController *settingnav = [[[UINavigationController alloc] initWithRootViewController:settingview] autorelease];
    
    UITabBarItem *setting = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:4]autorelease];
    settingnav.tabBarItem = setting;
    
    
    NSMutableArray *viewContrllers = [NSMutableArray arrayWithObjects:
                                      newsnav,
                                      historynav,
                                      disturbnav,
                                      favnav,
                                      settingnav,
                                      nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithArray:viewContrllers];
    
    [self.window addSubview:self.tabBarController.view];
    self.window.rootViewController = self.tabBarController;
    
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"P2PBOX" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"P2PBOX.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
