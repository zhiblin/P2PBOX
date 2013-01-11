//
//  PLBSViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-26.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PLBSViewController.h"
#import "PMAPViewController.h"

@interface PLBSViewController ()

@end

@implementation PLBSViewController

@synthesize startlatitudetextfield,startlongitudetextfield,distancetextfield,endlatitudetextfield,endlongitudetextfield,lngstr,latstr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *loginBut =[[UIBarButtonItem alloc] initWithTitle:@"to map" style:UIBarButtonItemStylePlain target:self action:@selector(tomap)];
    self.navigationItem.rightBarButtonItem = loginBut;
    [loginBut release];
    startlatitudetextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    startlatitudetextfield.text = @"1";
    [self.view addSubview:startlatitudetextfield];
    
    startlongitudetextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 100, 30)];
    startlongitudetextfield.text = @"1";
    
    [self.view addSubview:startlongitudetextfield];
    
    distancetextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 90, 100, 30)];
    distancetextfield.text = @"1";
    [self.view addSubview:distancetextfield];
    
    lm = [[CLLocationManager alloc]init];
    if([CLLocationManager locationServicesEnabled]) {
        lm.delegate = self;
        lm.desiredAccuracy = kCLLocationAccuracyBest;
        lm.distanceFilter = 1000.0f;
        [lm startUpdatingLocation];}
	// Do any additional setup after loading the view.
}

-(void)tomap{
    PMAPViewController *map = [[PMAPViewController alloc] init];
    [self.navigationController pushViewController:map animated:YES];
}

- (void) locationManager: (CLLocationManager *) manager didUpdateToLocation:(CLLocation *)newLocation
            fromLocation: (CLLocation *) oldLocation{
    NSString *lat = [[NSString alloc] initWithFormat:@"%g",newLocation.coordinate.latitude];
    startlatitudetextfield.text = lat;
    self.latstr = lat;
    NSString *lng = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
    startlongitudetextfield.text = lng;
    
    NSString *acc = [[NSString alloc] initWithFormat:@"%g",newLocation.horizontalAccuracy];
    distancetextfield.text = acc;
    self.lngstr = lng;
    
    [acc release];
    [lat release];
    [lng release];
}
 
- (void) locationManager: (CLLocationManager *) managerdidFailWithError: (NSError *) error {
    NSString *msg = [[NSString alloc]initWithString:@"Error obtaining location"];
    UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Error"message:msg delegate:nil cancelButtonTitle: @"Done" otherButtonTitles:nil];
    [alert show];
    [msg release];
    [alert release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
