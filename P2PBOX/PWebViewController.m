//
//  PWebViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 13-1-9.
//  Copyright (c) 2013年 p2pmsg. All rights reserved.
//

#import "PWebViewController.h"

@implementation PWebViewController

@synthesize myWebView;




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, 320, 400)];
//    [web setUserInteractionEnabled:NO];
//    
//    [web setBackgroundColor:[UIColor clearColor]];
//    
//    [web setDelegate:self];
//    
//    [web setOpaque:NO];//使网页透明
//    
//    
//    
//    NSString *path = @"http://www.baidu.com";
//    
//    NSURL *url = [NSURL URLWithString:path];
//    
//    [web loadRequest:[NSURLRequest requestWithURL:url]];
//

    
}
/*
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [activityIndicator startAnimating];
    
}


*/
//数据加载完

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
//    [activityIndicator stopAnimating];
    
    UIView *view = (UIView *)[self.view viewWithTag:103];
    
    [view removeFromSuperview];
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
