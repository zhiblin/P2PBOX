//
//  PNEWSViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-25.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PNEWSViewController.h"
#import "PLBSViewController.h"
#import "PCategory.h"
#import "PContextListViewController.h"
#import "PEditViewController.h"


@interface PNEWSViewController ()

@end


@implementation PNEWSViewController

@synthesize tableview;
@synthesize managedObjectContext;
@synthesize fetchedResultsController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    PAppDelegate *appdel = (PAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.managedObjectContext = appdel.managedObjectContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PCategory" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    
    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:@"pCategoryID" ascending:YES];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"pCategoryJudge == '1'"];
    NSArray *sortarray = [[NSArray alloc] initWithObjects:sorter, nil];
    
    [request setSortDescriptors:sortarray];
    [request setPredicate:pre];
    
    NSError *error;
    
    NSMutableArray *result = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    self.mutablearray = result;
    */
    
    NSError *error = nil;
	if (![[self fetchedResultsController] performFetch:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
    
    self.title = @"最新优惠";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIBarButtonItem *loginBut =[[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(tolocation)];
    loginBut.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = loginBut;
    [loginBut release];
    
    UIBarButtonItem *leftBut =[[UIBarButtonItem alloc] initWithTitle:@"勿扰" style:UIBarButtonItemStylePlain target:self action:@selector(toedit)];
    leftBut.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftBut;
    [leftBut release];
    
    self.tableview = [[[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain] autorelease];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    tableview.allowsSelection = YES;//能够点击
    
    [self.view addSubview:tableview];
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.tableview reloadData];
}


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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [fetchedResultsController release];
    [tableview release];
    [super dealloc];
    
    
}



-(void)tolocation{
   
    
    PEditViewController *editview = [[PEditViewController alloc] init];
    [self.navigationController pushViewController:editview animated:YES];
    NSLog(@"location....");
}

-(void)toedit{
    
    PLBSViewController *plbs =  [[PLBSViewController alloc] init];
    [self.navigationController pushViewController:plbs animated:YES];
//    [self.tableview setEditing:!self.tableview.editing animated:YES];
}


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
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
 
    /*
    NSUInteger row = indexPath.row; //获取行号
    
    NSString  *titleStr = [dataArray objectAtIndex:row];//获取数据
    
    cell.textLabel.text = titleStr;//数据显示
    */
    return cell;
    
}



//设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

/*
//分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}
//设置每个区有多少行共有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

//设置区域的名称
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    return @"123";
}
*/
//是否允许行移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return NO;
}

//响应点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"响应单击事件");
    PCategory *category = [fetchedResultsController objectAtIndexPath:indexPath];
    PContextListViewController *plist = [[PContextListViewController alloc] init];
    plist.titlestr = category.pCategoryName;
    plist.categoryID = category.pCategoryID;
    
    NSLog(@"category is %@ , cid is %@",category.pCategoryName,category.pCategoryID);
    
    [self.navigationController pushViewController:plist animated:YES];
    
}

//小按钮的响应事件
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"accessoryButton的响应事件");
    
}

//删除按钮的名字
-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"屏蔽";
}
//设置滑动，
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    //ruturn NO不实现滑动
    return NO;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"手指撮动了");
    return UITableViewCellEditingStyleDelete;
    //    //插入
    //    return UITableViewCellEditingStyleInsert;
}
//点击屏蔽按钮之后的操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
    
    PCategory *category = (PCategory *)[fetchedResultsController objectAtIndexPath:indexPath];
    //[self.mutablearray objectAtIndex:indexPath.row];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        category.pCategoryJudge = @"2";
        [managedObjectContext deleteObject:[fetchedResultsController objectAtIndexPath:indexPath]];
        NSError *error = nil;
        if (![category.managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        // 删除被惯例对象在索引路径（index path）
		//NSManagedObject *eventToDelete = [eventsArray objectAtIndex:indexPath.row];
		//[managedObjectContext deleteObject:eventToDelete];
        
        // 更新数组和列表视图
        //[eventsArray removeObjectAtIndex:indexPath.row];
        //[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
        
		// 提交更改到Core Data
		//NSError *error;
		//if (![managedObjectContext save:&error]) {
			// Handle the error.
		//}
    }
    
    [tableview reloadData];
     
    [tableView setEditing:NO animated:YES];
}

- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell to show the book's title
    PCategory *category = [self.fetchedResultsController objectAtIndexPath:indexPath];
    category.pCategoryJudge = @"2";
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
