//
//  PFavoriteViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-25.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PFavoriteViewController.h"

@implementation PFavoriteViewController

@synthesize webView,activityIndicatorView,textField,goButton;



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"fav";
    
    
    /*
    activityIndicatorView = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] autorelease];
    
    [activityIndicatorView setCenter:self.view.center];
    [activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [self.view addSubview:activityIndicatorView];
    
    
    
    
    textField = [[[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width-20, 30)] autorelease];
    textField.placeholder = @"输入";
    
    
    [self.view addSubview:textField];
    
    UIButton *roundedRectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    CGRect buttonRect = CGRectMake(self.view.bounds.size.width-20,0,20,30);
    [roundedRectButton setFrame:buttonRect];
    
    [roundedRectButton setTitle:@"Normal" forState:UIControlStateNormal];
    [roundedRectButton setTitle:@"Highlighted" forState:UIControlStateHighlighted];
    roundedRectButton.showsTouchWhenHighlighted = YES;
    
    //[roundedRectButton addTarget:self action:@selector(buttonDown:) forControlEvents:UIControlEventTouchDown];
    [roundedRectButton addTarget:self action:@selector(goUrl) forControlEvents:UIControlEventTouchUpInside];
    self.goButton = roundedRectButton;
    
    [self.view addSubview:goButton];
    [roundedRectButton release];
    */
    //webView  =  [[[UIWebView alloc] initWithFrame:CGRectMake(0, 30, self.view.window.bounds.size.width, self.view.window.bounds.size.height-30)] autorelease];
    
    webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 0,self.view.bounds.size.width, self.view.bounds.size.height);
    webView.delegate = self;
    webView.scalesPageToFit =YES;
    [self loadWebPageWithString:@"http://www.jsfoot.com/html5/demo/2012-04-14/562.html"];
    webView.opaque = NO;
    [self.view addSubview:webView];
    //[webView release];
    
}

-(void)loadWebPageWithString:(NSString *) urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"%@",urlString);
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
}

- (void)goUrl{
    
    [textField resignFirstResponder];
    [self loadWebPageWithString:textField.text];
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicatorView startAnimating] ;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicatorView stopAnimating];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription]
                                                       delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alterview show];
    [alterview release];    
}


- (void)dealloc{
    
    [webView release];
    [activityIndicatorView release];
    [textField release];
    [goButton release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
