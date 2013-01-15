//
//  PFavoriteViewController.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-25.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFavoriteViewController : UIViewController<UIWebViewDelegate>
{
    UIWebView *webView;
    UITextField *textField;
    UIActivityIndicatorView *activityIndicatorView;
    UIButton *goButton;
}


@property(retain, nonatomic) UIWebView *webView;
@property(retain, nonatomic) UITextField *textField;
@property(retain, nonatomic) UIActivityIndicatorView *activityIndicatorView;
@property(retain, nonatomic) UIButton *goButton;

- (void)goUrl;

- (void)loadWebPageWithString:(NSString*)urlString; 

@end
