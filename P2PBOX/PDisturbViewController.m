//
//  PDisturbViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-25.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PDisturbViewController.h"


@interface PDisturbViewController ()

@end

@implementation PDisturbViewController

@synthesize textf;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"disturb";
	// Do any additional setup after loading the view.
    NSString *googleURL = @"http://www.weather.com.cn/data/cityinfo/101280101.html";
	NSURL *url = [NSURL URLWithString:googleURL];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    
    textf =  [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 320, 200)];
    
    [self.view addSubview:textf];
    NSLog(@"test git");
}

-(void)requestFinished:(ASIHTTPRequest *)request{
    
    NSString *responseString = [request responseString];
    NSLog(@"%@",responseString);
    
    
    NSData *responseData = [request responseData];
    NSLog(@"%@",responseData);
    
    NSError *error;
    NSMutableDictionary *iosjson = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    NSLog(@"ios json text is %@",iosjson);
    
    NSMutableDictionary *jsonoSubObj = [iosjson objectForKey:@"weatherinfo"];
    city = [[NSString alloc] initWithFormat:@"%@\n",[jsonoSubObj objectForKey:@"city"]];
    
    weather =[[NSString alloc] initWithFormat:@"%@\n",[jsonoSubObj objectForKey:@"weather"]];
    
    temp =[[NSString alloc] initWithFormat:@"%@\n",[jsonoSubObj objectForKey:@"temp1"]];
    
    [textf setText:city];
}

-(void)requestFailed:(ASIHTTPRequest *)request{
    NSError *error = [request error];
    NSLog(@"%@",error);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
