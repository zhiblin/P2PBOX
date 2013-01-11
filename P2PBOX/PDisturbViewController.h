//
//  PDisturbViewController.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-25.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface PDisturbViewController : UIViewController<ASIHTTPRequestDelegate>{
    NSString *outString;
    NSString *city;
    NSString *weather;
    NSString *temp ;
    UITextField *textf;
}

@property(retain, nonatomic) UITextField *textf;

@end
