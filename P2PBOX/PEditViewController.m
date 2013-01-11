//
//  PEditViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 13-1-2.
//  Copyright (c) 2013年 p2pmsg. All rights reserved.
//

#import "PEditViewController.h"
#import "PCategory.h"


@implementation PEditViewController

@synthesize tableview,managedObjectContext,fetchedResultsController;



#pragma mark -
#pragma mark Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }
    PAppDelegate *appdel = (PAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.managedObjectContext = appdel.managedObjectContext;
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"PCategory" inManagedObjectContext:self.managedObjectContext];
	[fetchRequest setEntity:entity];
	[fetchRequest setFetchBatchSize:20];
	
    
	NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"pCategoryID" ascending:YES];
	//NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"age" ascending:NO];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor1,nil];
	[fetchRequest setSortDescriptors:sortDescriptors];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"pCategoryJudge == '1'"];
    [fetchRequest setPredicate:pre];
	
    
	NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:@"Item1"];
    aFetchedResultsController.delegate = self;
	self.fetchedResultsController = aFetchedResultsController;
	
	[aFetchedResultsController release];
	[fetchRequest release];
	[sortDescriptor1 release];
	//[sortDescriptor2 release];
	[sortDescriptors release];
	
	return fetchedResultsController;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSError *error = nil;
	if (![[self fetchedResultsController] performFetch:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
    
    self.tableview = [[[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain] autorelease];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    tableview.allowsSelection = YES;//能够点击
    
    [self.view addSubview:tableview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//table delegate method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[fetchedResultsController sections] count];//这里使用默认，如果你的数据需要分组显示，在这里就可以定义你所需要的组的个数
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //mutablearrays是你所定义的数据存储数组
    return [[[fetchedResultsController sections] objectAtIndex:section] numberOfObjects];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"MyIdentifier"; //相当于一个行标识
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    //tableViewCell重绘
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] ;
        
    }
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    PCategory *pcategory = [fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = pcategory.pCategoryName;
    [[cell imageView] setImage:[UIImage imageNamed:@"jiaozi.jpeg"]];
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    //SEL removesel = NSSelectorFromString(@"toremovelist:");
    
    //[self performSelector:removesel withObject:indexPath];
    
    UIButton *editbut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    editbut.frame = CGRectMake(250, 20, 50, 40);
    [editbut setTitle:@"屏蔽" forState:UIControlStateNormal];
    //editbut.backgroundColor = [UIColor redColor];
    [editbut addTarget:self action:@selector(toremovelist:) forControlEvents:UIControlEventTouchUpInside];
    //[editbut setHidden:YES];
    [cell addSubview:editbut];
    
    
    
    return cell;
    
}



//设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}




//to remove from this list

-(void)toremovelist:(UIButton *)button{
    
    NSLog(@"111");
    NSIndexPath *indexPath;
    if ([button.superview isKindOfClass:[UITableViewCell class]]){
        UITableViewCell *cell = (UITableViewCell*)button.superview;
        indexPath= [self.tableview indexPathForCell:cell];
    }
    PCategory *pcategory = [fetchedResultsController objectAtIndexPath:indexPath];
 
    pcategory.pCategoryJudge = @"2";
    NSError *error = nil;
    if (![pcategory.managedObjectContext save:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell to show the book's title
    PCategory *category = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = category.pCategoryName;
}

#pragma mark NSFetchedResultsControllerDelegate methods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableview beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableview;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
            
        case NSFetchedResultsChangeUpdate:
             [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
             break;
             
        case NSFetchedResultsChangeMove:
             [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
             // Reloading the section inserts a new row and ensures that titles are updated appropriately.
             [tableView reloadSections:[NSIndexSet indexSetWithIndex:newIndexPath.section] withRowAnimation:UITableViewRowAnimationFade];
             break;
             
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableview insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableview deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.tableview endUpdates];
}

@end
