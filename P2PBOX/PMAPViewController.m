//
//  PMAPViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-26.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PMAPViewController.h"

@interface PMAPViewController ()

@end

@implementation PMAPViewController

NSString *userLatitude;
NSString *userlongitude;

@synthesize mapview;


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
    userLatitude=@"";
    userlongitude=@"";
    mapview = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapview.mapType = MKMapTypeStandard;//MKMapTypeHybrid;
    mapview.delegate=self;
    mapview.showsUserLocation=YES;
    [self.view addSubview:mapview];
	// Do any additional setup after loading the view.
}

-(void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    NSString *lat=[[NSString alloc] initWithFormat:@"%f",userLocation.coordinate.latitude];
    NSString *lng=[[NSString alloc] initWithFormat:@"%f",userLocation.coordinate.longitude];
    
    NSLog(@"latz:%@  lng : %@",lat,lng);
    
    userLatitude=lat;
    userlongitude=lng;
    
    MKCoordinateSpan span;
    MKCoordinateRegion region;
    
    span.latitudeDelta=0.010;
    span.longitudeDelta=0.010;
    region.span=span;
    region.center=[userLocation coordinate];
    
    
    [mapview setRegion:[mapview regionThatFits:region] animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
