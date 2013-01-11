//
//  PContextListViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-27.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PContextListViewController.h"
#import "PAppDelegate.h"
#import "PDetailMsg.h"
#import "PCustomCellView.h"
#import "PCustomCell.h"

@interface PContextListViewController ()

@end

@implementation PContextListViewController

@synthesize tableview,mutablearray,titlestr,categoryID,plbs;



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = titlestr;
    
    PAppDelegate *appdel = (PAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *managecontext = appdel.managedObjectContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PDetailMsg" inManagedObjectContext:managecontext];
    
    [request setEntity:entity];
    
    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:@"pDetailMsgID" ascending:NO];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"pCategoryID == %@",categoryID];
    NSArray *sortarray = [[NSArray alloc] initWithObjects:sorter, nil];
    
    [request setSortDescriptors:sortarray];
    [request setPredicate:pre];
    
    NSError *error;
    
    NSMutableArray *result = [[managecontext executeFetchRequest:request error:&error] mutableCopy];
    
    self.mutablearray = result;
    
    self.tableview = [[[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain] autorelease];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    //self.tableview.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:tableview];
    
    PLBSViewController *plbstemp = [[PLBSViewController alloc] init];
    self.plbs = plbstemp;
    [plbstemp release];
}

- (void)dealloc
{
    [tableview release];
    [plbs release];
    [super dealloc];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [mutablearray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    PDetailMsg *detail = [self.mutablearray objectAtIndex:indexPath.row];
    
   
    PCustomCellView *pccv = [[PCustomCellView alloc] init];
    
    
    pccv.contextName.text = detail.pDetailMsgName;
    [pccv.imageOne setImage:[[UIImage alloc]initWithData:detail.pDetailMsgImageOne]];
    //[pccv.imageOne setImage:[UIImage imageNamed:@"jiaozi.jpeg"]];
    [pccv.imageOne setImage:[[UIImage alloc]initWithData:detail.pDetailMsgImageTwo]];
    pccv.context.text = detail.pDetailMsgContext;
    NSLog(@"%@",detail.pDetailMsgName);
    CLLocation* orig=[[[CLLocation alloc] initWithLatitude:[self.plbs.latstr doubleValue]  longitude:[plbs.lngstr doubleValue]] autorelease];
    CLLocation* dist=[[[CLLocation alloc] initWithLatitude:[detail.pDetailMsgLat doubleValue] longitude:[detail.pDetailMsgLng doubleValue] ] autorelease];
    
    CLLocationDistance kilometers=[orig distanceFromLocation:dist];//1000;
    
    pccv.distance.text = [NSString stringWithFormat:@"距离:%0.2f米",kilometers];
    
    [cell.contentView addSubview:pccv];
    //[cell.imageView setImage:[[UIImage alloc]initWithData:detail.pDetailMsgImageOne]];
    //cell.textLabel.text = detail.pDetailMsgName;
     
     
    
    static NSString *CellIdentifier = @"Cell";
    PCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[PCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    PDetailMsg *detail = [self.mutablearray objectAtIndex:indexPath.row];
    //PCustomCellView *pccv = [[PCustomCellView alloc] init];
    
    
    cell.contextName.text = detail.pDetailMsgName;
    [cell.imageOne setImage:[[UIImage alloc]initWithData:detail.pDetailMsgImageOne]];
    [cell.imageOne setImage:[[UIImage alloc]initWithData:detail.pDetailMsgImageTwo]];
    
    cell.context.text = detail.pDetailMsgContext;
    NSLog(@"%@",detail.pDetailMsgName);
    CLLocation* orig=[[[CLLocation alloc] initWithLatitude:[self.plbs.latstr doubleValue]  longitude:[plbs.lngstr doubleValue]] autorelease];
    CLLocation* dist=[[[CLLocation alloc] initWithLatitude:[detail.pDetailMsgLat doubleValue] longitude:[detail.pDetailMsgLng doubleValue] ] autorelease];
    
    CLLocationDistance kilometers=[orig distanceFromLocation:dist];//1000;
    
    cell.distance.text = [NSString stringWithFormat:@"距离:%0.2f米",kilometers];
    */
    static NSString *CellIdentifier = @"Cell";
    PCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[PCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    PDetailMsg *detail = [self.mutablearray objectAtIndex:indexPath.row];
    CLLocation* orig=[[[CLLocation alloc] initWithLatitude:[self.plbs.latstr doubleValue]  longitude:[plbs.lngstr doubleValue]] autorelease];
    CLLocation* dist=[[[CLLocation alloc] initWithLatitude:[detail.pDetailMsgLat doubleValue] longitude:[detail.pDetailMsgLng doubleValue] ] autorelease];
    
    CLLocationDistance kilometers=[orig distanceFromLocation:dist];
    
        UIImageView *image=[[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 5.0f, 70, 70)];
        [image setImage:[[UIImage alloc]initWithData:detail.pDetailMsgImageOne]];
        //        image.scalesPageToFit = YES;
        image.tag = 1000;
        UIImageView *imagesmall=[[UIImageView alloc] initWithFrame:CGRectMake(80.0f, 60.0f, 20, 20)];
        [imagesmall setImage:[[UIImage alloc]initWithData:detail.pDetailMsgImageOne]];
        //        image.scalesPageToFit = YES;
        image.tag = 1005;
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 200, 20)];
        label1.text = detail.pDetailMsgName;
        label1.tag = 1001;
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(80, 25, 200, 45)];
    label2.text = detail.pDetailMsgContext;
    label2.tag = 1002;
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(100, 60, 200, 20)];
    label3.text = [NSString stringWithFormat:@"距离:%0.2f米",kilometers];
        label3.tag = 1003;
       // UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(100, 63, 150, 20)];
       // label4.tag = 1004;
    
    /*
        UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        btnLeft.frame = CGRectMake(100, 84, 100, 25);
        
        [btnLeft setTitle:@"呼叫专家" forState:UIControlStateNormal];
        btnLeft.tag = row;
        [btnLeft addTarget:self action:@selector(toCallExpert:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnRight.frame = CGRectMake(220, 84, 100, 25);
        btnRight.tag = row;
        [btnRight setTitle:@"文字咨询" forState:UIControlStateNormal];
        [btnRight addTarget:self action:@selector(toAddRefer:) forControlEvents:UIControlEventTouchUpInside];
        */
        [cell addSubview:image];
        [cell addSubview:imagesmall];
        [cell addSubview:label1];
        [cell addSubview:label2];
        [cell addSubview:label3];
        //[cell addSubview:label4];
        //[cell addSubview:btnLeft];
        //[cell addSubview:btnRight];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoteDetailViewController *noteDetailViewController=[[NoteDetailViewController alloc]initWithNibName:@"NoteDetailViewController" bundle:nil];
    noteDetailViewController.note=[self.notelist objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:noteDetailViewController animated:YES];
    [noteDetailViewController release];
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    Note *note=[[self.notelist objectAtIndex:sourceIndexPath.row] retain];
    [self.notelist removeObjectAtIndex:sourceIndexPath.row];
    [self.notelist insertObject:note atIndex:destinationIndexPath.row];
    [note release];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoteWithCoreDataAppDelegate *appDelegate=(NoteWithCoreDataAppDelegate *)[[UIApplication sharedApplication]delegate];
    Note *note=[self.notelist objectAtIndex:indexPath.row];
    if(editingStyle==UITableViewCellEditingStyleDelete)
    {
        [appDelegate.managedObjectContext deleteObject:note];
        [self.notelist removeObject:note];
    }
    [appDelegate saveContext];
    [self.tableView reloadData];
}
*/

@end
