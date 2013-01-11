//
//  PHistoryViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-25.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PHistoryViewController.h"
#import "PCustomCellView.h"
#import "JSON.h"

@implementation PHistoryViewController

@synthesize textf;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"history";
    
    PCustomCellView *pccv = [[PCustomCellView alloc] init];
    [pccv.imageOne setImage:[UIImage imageNamed:@"jiaozi.jpeg"]];
    [pccv.imageTwo setImage:[UIImage imageNamed:@"jiaozi.jpeg"]];
    pccv.distance.text = @"text";
    pccv.context.text = @"text11";
    pccv.contextName.text = @"textsss";
    [self.view addSubview:pccv];
    
    
    textf =  [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 320, 200)];
    
    [self.view addSubview:textf];
	// Do any additional setup after loading the view.
    //请求地址
    NSString *googleURL = @"http://www.weather.com.cn/data/cityinfo/101280101.html";
	NSURL *url = [NSURL URLWithString:googleURL];
//	NSMutableURLRequest就是NSURLRequest子类，可以让客户端程序更改现有的请求。
    NSMutableURLRequest *mrequest = [[NSMutableURLRequest alloc] initWithURL:url];
    NSURLConnection *mconn = [[NSURLConnection alloc] initWithRequest:mrequest delegate:self];
    [mconn start];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    if (mconn) {
        NSLog(@"success!!!");
    } else {
        NSLog(@"fail!!!");
    }
    
    
//	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
////	建立连接
//	NSURLConnection *connection = [[NSURLConnection alloc]
//								   initWithRequest:request
//								   delegate:self];
//	
//	[connection release];
//	[request release];

}
//接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	outString = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
    
    NSError *error;
    NSMutableDictionary *iosjson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"ios json text is %@",iosjson);
	NSLog(@"%@", outString);
}

-(void) connection:(NSURLConnection *)connection
  didFailWithError: (NSError *)error {
	UIAlertView *errorAlert = [[UIAlertView alloc]
							   initWithTitle: [error localizedDescription]
							   message: [error localizedFailureReason]
							   delegate:nil
							   cancelButtonTitle:@"OK"
							   otherButtonTitles:nil];
	[errorAlert show];
	[errorAlert release];
//	[activityIndicator stopAnimating];
}

- (void) connectionDidFinishLoading: (NSURLConnection*) connection {
//	[activityIndicator stopAnimating];
	
    
    NSMutableDictionary *jsonoObj = [outString JSONValue]; NSLog(@"json text is %@", jsonoObj);
    
    NSMutableDictionary *jsonoSubObj = [jsonoObj objectForKey:@"weatherinfo"];
    city = [[NSString alloc] initWithFormat:@"%@\n",[jsonoSubObj objectForKey:@"city"]];
    
    weather =[[NSString alloc] initWithFormat:@"%@\n",[jsonoSubObj objectForKey:@"weather"]];
    
    temp =[[NSString alloc] initWithFormat:@"%@\n",[jsonoSubObj objectForKey:@"temp1"]];
    
    [textf setText:city];
//    citylabel.text = city;
//    weatherlabel.text = weather;
//    templabel.text = temp;
    
    // textView.text = text; [text release];
    [outString release];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
